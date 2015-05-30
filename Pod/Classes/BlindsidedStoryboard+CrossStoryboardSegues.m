#import "BlindsidedStoryboard+CrossStoryboardSegues.h"

@implementation BlindsidedStoryboard (CrossStoryboardSegues)

- (instancetype)crossstoryboardsegues_storyboardWithName:(NSString *)name bundle:(NSBundle *)storyboardBundleOrNil {
    return [[self class] storyboardWithName:name bundle:storyboardBundleOrNil injector:self.injector];
}

@end
