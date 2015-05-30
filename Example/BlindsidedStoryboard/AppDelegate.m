#import "AppDelegate.h"
#import "BlindsidedStoryboard.h"

@interface AppDelegate () <BSModule>
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    UIStoryboard *storyboard = [BlindsidedStoryboard storyboardWithName:@"Main" bundle:nil injector:self.injector];
    UIViewController *viewController = [storyboard instantiateInitialViewController];
    self.window.rootViewController = viewController;

    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - <BSModule>

- (void)configure:(id<BSBinder>)binder {
    [binder bind:@"firstTitle" toInstance:@"First Screen"];
    [binder bind:@"secondTitle" toInstance:@"Second Screen"];
    [binder bind:@"embeddedColor" toInstance:[UIColor cyanColor]];
}

#pragma mark - Accessors

- (id<BSInjector>)injector {
    if (!_injector) {
        _injector = [Blindside injectorWithModule:self];
    }
    return _injector;
}

@end
