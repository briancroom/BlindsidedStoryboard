#import <UIKit/UIKit.h>
#import <Blindside/Blindside.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * View controllers instantiated by an instance of this class will have
 * their properties injected, if they implement a +bsProperties method.
 *
 * When following a segue, the destination view controller is created
 * by the same storyboard as the source view controller, so it will also
 * be injected. Switching storyboards by means of Xcode 7's storyboard
 * references is also supported, and maintains the same injector.
 */
@interface BlindsidedStoryboard : UIStoryboard

/// The injector instance that will be used to inject view controllers' properties
@property (nonatomic, strong) id<BSInjector> injector;


/**
 * Creates and returns a storyboard object for the specified storyboard resource file.
 * The given injector object will be used to inject dependencies of view controllers
 * instantiated by the storyboard.
 *
 * @param name The name of the storyboard resource file without the filename extension. This method raises an exception if this parameter is `nil`.
 * @param storyboardBundleOrNil The bundle containing the storyboard file and its related resources. If you specify `nil`, this method looks in the main bundle of the current application.
 * @param injector An injector that will be used to inject dependencies into view controllers
 * @return A storyboard object for the specified file. If no storyboard resource file matching `name` exists, an exception is thrown with description: `Could not find a storyboard named 'XXXXXX' in bundle....`
 */
+ (instancetype)storyboardWithName:(NSString *)name bundle:(nullable NSBundle *)storyboardBundleOrNil injector:(id<BSInjector>)injector;

@end

NS_ASSUME_NONNULL_END
