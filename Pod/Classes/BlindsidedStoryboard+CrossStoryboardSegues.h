#import "BlindsidedStoryboard.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * This category enables integration with the CrossStoryboardSegues library (https://github.com/briancroom/CrossStoryboardSegues)
 */
@interface BlindsidedStoryboard (CrossStoryboardSegues)

/// This method is used by the CrossStoryboardSegues library to allow injection to continue when switching storyboards.
- (instancetype)crossstoryboardsegues_storyboardWithName:(NSString *)name bundle:(nullable NSBundle *)storyboardBundleOrNil;

@end

NS_ASSUME_NONNULL_END
