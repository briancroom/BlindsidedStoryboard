#import <Foundation/Foundation.h>
#import <Blindside/Blindside.h>

@interface TestModule : NSObject <BSModule>

@property (nonatomic, copy) void (^block)(id<BSBinder>);

- (instancetype)initWithBlock:(void (^)(id<BSBinder>))block;

@end
