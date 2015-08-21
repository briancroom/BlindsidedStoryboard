#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * This object can be used as an injector key to provide the default binding of loading
 * a view controller from a storyboard
 *
 * It could be used in your class' `bsInitializer` definition like this:
 * \code
 * + (BSInitializer *)bsInitializer {
 *     SEL sel = @selector(initWithChildViewController:);
 *     id key = [BSStoryboardKey keyForInitialViewControllerInStoryboardWithName:@"ChildViewController"];
 *     return [BSInitializer initializerWithClass:self selector:sel argumentKeys:key, nil];
 * }
 * \endcode
 *
 * This would result in the referenced view controller being loaded and injected without
 * any explicit binding being required on the injector.
 */
@interface BSStoryboardKey : NSObject

/**
 * Creates a key which refers to the initial view controller from a storyboard.
 *
 * @param storyboardName The name of the storyboard in the main bundle from which to load the view controller.
 */
+ (instancetype)keyForInitialViewControllerInStoryboardWithName:(NSString *)storyboardName;

/**
 * Creates a key which refers to the initial view controller from a storyboard.
 *
 * @param storyboardName The name of the storyboard from which to load the view controller.
 * @param bundle The bundle which contains the storyboard
 */
+ (instancetype)keyForInitialViewControllerInStoryboardWithName:(NSString *)storyboardName
                                                         bundle:(nullable NSBundle *)bundle;

/**
 * Creates a key which refers to a view controller from a storyboard.
 *
 * @param identifier The string identifying which view controller to load
 * @param storyboardName The name of the storyboard in the main bundle from which to load the view controller.
 */
+ (instancetype)keyForViewControllerWithIdentifier:(NSString *)identifier
                                    storyboardName:(NSString *)storyboardName;

/**
 * Creates a key which refers to a view controller from a storyboard.
 *
 * @param identifier The string identifying which view controller to load
 * @param storyboardName The name of the storyboard from which to load the view controller.
 * @param bundle The bundle which contains the storyboard
 */
+ (instancetype)keyForViewControllerWithIdentifier:(NSString *)identifier
                                    storyboardName:(NSString *)storyboardName
                                            bundle:(nullable NSBundle *)bundle;

@end

NS_ASSUME_NONNULL_END
