#import <UIKit/UIKit.h>
#import <Blindside/Blindside.h>

@interface BlindsidedStoryboard : UIStoryboard

@property (nonatomic, strong) id<BSInjector> injector;

+ (instancetype)storyboardWithName:(NSString *)name bundle:(NSBundle *)storyboardBundleOrNil injector:(id<BSInjector>)injector;

@end
