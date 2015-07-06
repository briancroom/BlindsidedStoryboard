#import <UIKit/UIKit.h>
#import <Blindside/Blindside.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlindsidedStoryboard : UIStoryboard

@property (nonatomic, strong) id<BSInjector> injector;

+ (instancetype)storyboardWithName:(NSString *)name bundle:(nullable NSBundle *)storyboardBundleOrNil injector:(id<BSInjector>)injector;

@end

NS_ASSUME_NONNULL_END
