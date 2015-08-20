#import <Foundation/Foundation.h>
#import <Blindside/Blindside.h>

NS_ASSUME_NONNULL_BEGIN

@interface BSStoryboardProvider : NSObject <BSProvider>

+ (instancetype)providerForInitialViewControllerInStoryboardWithName:(NSString *)storyboardName;
+ (instancetype)providerForInitialViewControllerInStoryboardWithName:(NSString *)storyboardName
                                                              bundle:(nullable NSBundle *)bundle;

+ (instancetype)providerForViewControllerWithIdentifier:(NSString *)identifier
                                         storyboardName:(NSString *)storyboardName;
+ (instancetype)providerForViewControllerWithIdentifier:(NSString *)identifier
                                         storyboardName:(NSString *)storyboardName
                                                 bundle:(nullable NSBundle *)bundle;


@end

NS_ASSUME_NONNULL_END
