#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "EmbeddedViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

@interface TestModule : NSObject <BSModule>
@property (nonatomic, copy) void (^block)(id<BSBinder>);
- (id)initWithBlock:(void (^)(id<BSBinder>))block;
@end

@implementation TestModule
- (id)initWithBlock:(void (^)(id<BSBinder>))block {
    if ((self = [super init])) {
        self.block = block;
    }
    return self;
}
- (void)configure:(id<BSBinder>)binder {
    self.block(binder);
}
@end

SPEC_BEGIN(AppDelegateSpec)

describe(@"AppDelegate", ^{
    __block AppDelegate *appDelegate;
    __block id<BSInjector> injector;
    __block UINavigationController *navController;
    NSString *firstTitle = @"firstTitle";
    NSString *secondTitle = @"secondTitle";
    UIColor *embeddedColor = [UIColor redColor];

    beforeEach(^{
        injector = [Blindside injectorWithModule:[[TestModule alloc] initWithBlock:^(id<BSBinder>binder){
            [binder bind:@"firstTitle" toInstance:firstTitle];
            [binder bind:@"secondTitle" toInstance:secondTitle];
            [binder bind:@"embeddedColor" toInstance:embeddedColor];
        }]];

        appDelegate = [[AppDelegate alloc] init];
        appDelegate.injector = injector;
        [appDelegate application:nil didFinishLaunchingWithOptions:nil];
        navController = (UINavigationController *)appDelegate.window.rootViewController;
        navController should be_instance_of([UINavigationController class]);
        [navController.view layoutIfNeeded];
    });

    it(@"should put FirstViewController on screen", ^{
        navController.topViewController should be_instance_of([FirstViewController class]);
    });

    it(@"should provide the first view controller with the injector", ^{
        [navController.topViewController valueForKey:@"injector"] should equal(injector);
    });

    it(@"should configure the first view controller with its title", ^{
        navController.topViewController.title should equal(firstTitle);
    });

    it(@"should have an embedded view controller", ^{
        [navController.topViewController.childViewControllers firstObject] should be_instance_of([EmbeddedViewController class]);
    });

    it(@"should set the embedded view controller's background color", ^{
        [[[navController.topViewController.childViewControllers firstObject] view] backgroundColor] should equal(embeddedColor);
    });

    describe(@"advancing to the second view controller", ^{
        beforeEach(^{
            [navController.topViewController performSegueWithIdentifier:@"Advance" sender:nil];
        });

        it(@"should put SecondViewController on screen", ^{
            navController.topViewController should be_instance_of([SecondViewController class]);
        });

        it(@"should provide the second view controller with the injector", ^{
            [navController.topViewController valueForKey:@"injector"] should equal(injector);
        });

        it(@"should configure the second view controller with its title", ^{
            navController.topViewController.title should equal(secondTitle);
        });
    });
});

SPEC_END
