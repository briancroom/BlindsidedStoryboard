#import <UIKit/UIKit.h>
#import <Blindside/Blindside.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) id<BSInjector> injector;
@property (strong, nonatomic) UIWindow *window;

@end
