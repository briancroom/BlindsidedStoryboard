#import "BlindsidedStoryboard.h"

NS_ASSUME_NONNULL_BEGIN

@interface BlindsidedStoryboard (CrossStoryboardSegues)
- (instancetype)crossstoryboardsegues_storyboardWithName:(NSString *)name bundle:(nullable NSBundle *)storyboardBundleOrNil;
@end

NS_ASSUME_NONNULL_END
