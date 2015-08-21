#import <Foundation/Foundation.h>
#import <Blindside/Blindside.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * A provider which can create a view controller from a storyboard, which will have
 * its own dependencies injected.
 *
 * It could be in your BSModule implementation like this:
 * \code
 * id<BSProvider> provider = [BSStoryboardProvider providerForInitialViewControllerInStoryboardWithName:@"MyStoryboard"];
 * [binder bind:[MyViewController class] toProvider:provider];
 * \endcode
 */
@interface BSStoryboardProvider : NSObject <BSProvider>

/**
 * Creates a provider which can create the initial view controller from a storyboard.
 *
 * @param storyboardName The name of the storyboard in the main bundle from which to load the view controller.
 */
+ (instancetype)providerForInitialViewControllerInStoryboardWithName:(NSString *)storyboardName;

/**
 * Creates a provider which can create the initial view controller from a storyboard.
 *
 * @param storyboardName The name of the storyboard from which to load the view controller.
 * @param bundle The bundle which contains the storyboard
 */
+ (instancetype)providerForInitialViewControllerInStoryboardWithName:(NSString *)storyboardName
                                                              bundle:(nullable NSBundle *)bundle;

/**
 * Creates a provider which can create a view controller from a storyboard.
 *
 * @param identifier The string identifying which view controller to load
 * @param storyboardName The name of the storyboard in the main bundle from which to load the view controller.
 */
+ (instancetype)providerForViewControllerWithIdentifier:(NSString *)identifier
                                         storyboardName:(NSString *)storyboardName;

/**
 * Creates a provider which can create a view controller from a storyboard.
 *
 * @param identifier The string identifying which view controller to load
 * @param storyboardName The name of the storyboard from which to load the view controller.
 * @param bundle The bundle which contains the storyboard
 */
+ (instancetype)providerForViewControllerWithIdentifier:(NSString *)identifier
                                         storyboardName:(NSString *)storyboardName
                                                 bundle:(nullable NSBundle *)bundle;

@end

NS_ASSUME_NONNULL_END
