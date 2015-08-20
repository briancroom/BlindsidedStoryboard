#import "TestModule.h"

@implementation TestModule

- (instancetype)initWithBlock:(void (^)(id<BSBinder>))block {
    if ((self = [super init])) {
        self.block = block;
    }
    return self;
}

- (void)configure:(id<BSBinder>)binder {
    self.block(binder);
}

@end
