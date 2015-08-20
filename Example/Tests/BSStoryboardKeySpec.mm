#import <Cedar/Cedar.h>
#import "BSStoryboardKey.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "TestModule.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BSStoryboardKeySpec)

describe(@"BSStoryboardKey", ^{
    __block id<BSInjector> injector;
    __block UIViewController *viewController;
    NSString *secondTitle = @"secondTitle";

    beforeEach(^{
        injector = [Blindside injectorWithModule:[[TestModule alloc] initWithBlock:^(id<BSBinder>binder){
            [binder bind:@"firstTitle" toInstance:@"title"];
            [binder bind:@"secondTitle" toInstance:secondTitle];
            [binder bind:@"embeddedColor" toInstance:[UIColor redColor]];
        }]];
    });

    describe(@"using a key to retrieve the initial view controller from a storyboard", ^{
        beforeEach(^{
            id key = [BSStoryboardKey keyForInitialViewControllerInStoryboardWithName:@"Main" bundle:nil];
            viewController = [injector getInstance:key];
        });

        it(@"should return a view controller", ^{
            viewController should be_instance_of([UITabBarController class]);
        });
    });

    describe(@"using a key to retrieve a view controller from a storyboard by its identifier", ^{
        beforeEach(^{
            id key = [BSStoryboardKey keyForViewControllerWithIdentifier:@"SecondViewController" storyboardName:@"Main" bundle:nil];
            viewController = [injector getInstance:key];
        });

        it(@"should return a view controller", ^{
            viewController should be_instance_of([SecondViewController class]);
        });

        it(@"should have its title injected", ^{
            viewController.title should equal(secondTitle);
        });

        it(@"should have injected the view controller", ^{
            [viewController valueForKey:@"injector"] should be_same_instance_as(injector);
        });
    });
});

SPEC_END
