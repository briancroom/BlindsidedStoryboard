#import <UIKit/UIKit.h>

@interface BlindsidedStoryboard : UIStoryboard

@property (nonatomic, strong) id<BSInjector> injector;

+ (instancetype)storyboardWithName:(NSString *)name bundle:(NSBundle *)storyboardBundleOrNil injector:(id<BSInjector>)injector;

@end
