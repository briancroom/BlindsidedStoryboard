#import "BSStoryboardProvider.h"
#import "BlindsidedStoryboardClass.h"

@interface BSStoryboardProvider ()
@property (nonatomic, copy) NSString *storyboardName;
@property (nonatomic, strong) NSBundle *storybordBundle;
@property (nonatomic, copy) NSString *viewControllerIdentifier;
@end

@implementation BSStoryboardProvider

+ (instancetype)providerForInitialViewControllerInStoryboardWithName:(NSString *)storyboardName {
    return [[self alloc] initWithStoryboardName:storyboardName
                                         bundle:nil
                       viewControllerIdentifier:nil];
}

+ (instancetype)providerForInitialViewControllerInStoryboardWithName:(NSString *)storyboardName bundle:(NSBundle *)bundle {
    return [[self alloc] initWithStoryboardName:storyboardName
                                         bundle:bundle
                       viewControllerIdentifier:nil];
}

+ (instancetype)providerForViewControllerWithIdentifier:(NSString *)identifier storyboardName:(NSString *)storyboardName {
    return [[self alloc] initWithStoryboardName:storyboardName
                                         bundle:nil
                       viewControllerIdentifier:identifier];
}

+ (instancetype)providerForViewControllerWithIdentifier:(NSString *)identifier storyboardName:(NSString *)storyboardName bundle:(NSBundle *)bundle {
    return [[self alloc] initWithStoryboardName:storyboardName
                                         bundle:bundle
                       viewControllerIdentifier:identifier];
}

- (instancetype)initWithStoryboardName:(NSString *)storyboardName
                                bundle:(NSBundle *)bundle
              viewControllerIdentifier:(NSString *)viewControllerIdentifier {
    if (self = [super init]) {
        _storyboardName = [storyboardName copy];
        _storybordBundle = bundle;
        _viewControllerIdentifier = [viewControllerIdentifier copy];
    }
    return self;
}

- (id)provide:(NSArray *)args injector:(id<BSInjector>)injector {
    UIStoryboard *storyboard = [BlindsidedStoryboard storyboardWithName:self.storyboardName
                                                                 bundle:self.storybordBundle
                                                               injector:injector];
    if (self.viewControllerIdentifier.length > 0) {
        return [storyboard instantiateViewControllerWithIdentifier:self.viewControllerIdentifier];
    } else {
        return [storyboard instantiateInitialViewController];
    }
}

@end
