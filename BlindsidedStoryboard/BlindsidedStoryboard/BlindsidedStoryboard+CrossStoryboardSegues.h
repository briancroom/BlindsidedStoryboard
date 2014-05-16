#import "BlindsidedStoryboard.h"

@interface BlindsidedStoryboard (CrossStoryboardSegues)
- (instancetype)crossstoryboardsegues_storyboardWithName:(NSString *)name bundle:(NSBundle *)storyboardBundleOrNil;
@end
