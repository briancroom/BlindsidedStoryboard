#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BSStoryboardKey : NSObject

+ (instancetype)keyForInitialViewControllerInStoryboardWithName:(NSString *)storyboardName;
+ (instancetype)keyForInitialViewControllerInStoryboardWithName:(NSString *)storyboardName
                                                         bundle:(nullable NSBundle *)bundle;

+ (instancetype)keyForViewControllerWithIdentifier:(NSString *)identifier
                                    storyboardName:(NSString *)storyboardName;
+ (instancetype)keyForViewControllerWithIdentifier:(NSString *)identifier
                                    storyboardName:(NSString *)storyboardName
                                            bundle:(nullable NSBundle *)bundle;
@end

NS_ASSUME_NONNULL_END
