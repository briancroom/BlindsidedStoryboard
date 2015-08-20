#import "BSStoryboardKey.h"
#import "BSStoryboardProvider.h"

@interface BSStoryboardKey ()
@property (nonatomic, copy) NSString *storyboardName;
@property (nonatomic, strong) NSBundle *storyboardBundle;
@property (nonatomic, copy) NSString *viewControllerIdentifier;
@end

@implementation BSStoryboardKey

+ (instancetype)keyForInitialViewControllerInStoryboardWithName:(NSString *)storyboardName {
    return [[self alloc] initWithStoryboardName:storyboardName
                                         bundle:nil
                       viewControllerIdentifier:nil];
}

+ (instancetype)keyForInitialViewControllerInStoryboardWithName:(NSString *)storyboardName bundle:(NSBundle *)bundle {
    return [[self alloc] initWithStoryboardName:storyboardName
                                         bundle:bundle
                       viewControllerIdentifier:nil];
}

+ (instancetype)keyForViewControllerWithIdentifier:(NSString *)identifier storyboardName:(NSString *)storyboardName {
    return [[self alloc] initWithStoryboardName:storyboardName
                                         bundle:nil
                       viewControllerIdentifier:identifier];
}

+ (instancetype)keyForViewControllerWithIdentifier:(NSString *)identifier storyboardName:(NSString *)storyboardName bundle:(NSBundle *)bundle {
    return [[self alloc] initWithStoryboardName:storyboardName
                                         bundle:bundle
                       viewControllerIdentifier:identifier];
}

- (instancetype)initWithStoryboardName:(NSString *)storyboardName
                                bundle:(NSBundle *)bundle
              viewControllerIdentifier:(NSString *)viewControllerIdentifier {
    if (self = [super init]) {
        _storyboardName = [storyboardName copy];
        _storyboardBundle = bundle;
        _viewControllerIdentifier = [viewControllerIdentifier copy];
    }
    return self;
}

- (id)bsCreateWithArgs:(NSArray *)args injector:(id<BSInjector>)injector {
    id<BSProvider> provider;
    if (self.viewControllerIdentifier.length > 0) {
        provider = [BSStoryboardProvider providerForViewControllerWithIdentifier:self.viewControllerIdentifier storyboardName:self.storyboardName bundle:self.storyboardBundle];
    } else {
        provider = [BSStoryboardProvider providerForInitialViewControllerInStoryboardWithName:self.storyboardName bundle:self.storyboardBundle];
    }
    return [provider provide:args injector:injector];
}

@end
