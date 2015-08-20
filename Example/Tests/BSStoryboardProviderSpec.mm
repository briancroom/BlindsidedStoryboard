#import <Cedar/Cedar.h>
#import "BSStoryboardProvider.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "TestModule.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BSStoryboardProviderSpec)

describe(@"BSStoryboardProvider", ^{
    __block BSStoryboardProvider *provider;
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

    describe(@"providing the initial view controller from a storyboard", ^{
        beforeEach(^{
            provider = [BSStoryboardProvider providerForInitialViewControllerInStoryboardWithName:@"Main" bundle:nil];
            viewController = [provider provide:@[] injector:injector];
        });

        it(@"should return a view controller", ^{
            viewController should be_instance_of([UITabBarController class]);
        });
    });

    describe(@"providing a view controller from a storyboard by its identifier", ^{
        beforeEach(^{
            provider = [BSStoryboardProvider providerForViewControllerWithIdentifier:@"SecondViewController" storyboardName:@"Main" bundle:nil];
            viewController = [provider provide:@[] injector:injector];
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
