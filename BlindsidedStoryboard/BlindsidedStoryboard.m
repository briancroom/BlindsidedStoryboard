#import "BlindsidedStoryboard.h"

@implementation BlindsidedStoryboard

+ (instancetype)storyboardWithName:(NSString *)name bundle:(NSBundle *)storyboardBundleOrNil injector:(id<BSInjector>)injector {
    BlindsidedStoryboard *storyboard = (BlindsidedStoryboard *)[self storyboardWithName:name bundle:storyboardBundleOrNil];
    storyboard.injector = injector;
    return storyboard;
}

- (id)instantiateViewControllerWithIdentifier:(NSString *)identifier {
    id controller = [super instantiateViewControllerWithIdentifier:identifier];

    [self.injector injectProperties:controller];
    for (id childController in [controller childViewControllers]) {
        [self.injector injectProperties:childController];
    }

    return controller;
}

@end
