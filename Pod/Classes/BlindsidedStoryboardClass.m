#import "BlindsidedStoryboardClass.h"
#import <objc/runtime.h>

@implementation BlindsidedStoryboard

+ (instancetype)storyboardWithName:(NSString *)name bundle:(NSBundle *)storyboardBundleOrNil injector:(id<BSInjector>)injector {
    BlindsidedStoryboard *storyboard = (BlindsidedStoryboard *)[self storyboardWithName:name bundle:storyboardBundleOrNil];
    storyboard.injector = injector;
    return storyboard;
}

- (id)instantiateViewControllerWithIdentifier:(NSString *)identifier {
    __block UIViewController *viewController;
    [self performWithSwizzledFactoryMethod:^{
        viewController = [super instantiateViewControllerWithIdentifier:identifier];
    }];

    if (viewController.storyboard == self) {
        [self injectViewController:viewController];
    }

    return viewController;
}

- (void)injectViewController:(UIViewController *)controller {
    [self.injector injectProperties:controller];
    for (id childController in [controller childViewControllers]) {
        [self injectViewController:childController];
    }
}

#pragma mark - Swizzling Helpers

/// This method performs the given block in a special temporary environment such that any new storyboard
/// that is created will be a BlindsidedStoryboard with the same injector as the receiver.
- (void)performWithSwizzledFactoryMethod:(void (^)(void))actionsWhileSwizzled {
    SEL factoryMethodSel = @selector(storyboardWithName:bundle:);
    Method factoryMethod = class_getClassMethod([UIStoryboard class], factoryMethodSel);

    __block id(*origImp)(id, SEL, id, id);
    IMP newImp = imp_implementationWithBlock(^(id _self, NSString *name, NSBundle *bundle){

        method_setImplementation(factoryMethod, (IMP)origImp);
        origImp = NULL;

        return [self blindsidedStoryboardWithName:name bundle:bundle];
    });
    origImp = (void *)method_setImplementation(factoryMethod, newImp);

    actionsWhileSwizzled();

    if (origImp) {
        method_setImplementation(factoryMethod, (IMP)origImp);
    }
    imp_removeBlock(newImp);
}

- (instancetype)blindsidedStoryboardWithName:(NSString *)name bundle:(NSBundle *)storyboardBundleOrNil {
    return [[self class] storyboardWithName:name bundle:storyboardBundleOrNil injector:self.injector];
}

@end
