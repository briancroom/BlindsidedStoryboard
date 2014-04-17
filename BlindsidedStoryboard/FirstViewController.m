#import "FirstViewController.h"

@interface FirstViewController ()
@property (nonatomic, strong) id<BSInjector> injector;
@end

@implementation FirstViewController

+ (BSPropertySet *)bsProperties {
    BSPropertySet *propertySet = [BSPropertySet propertySetWithClass:self propertyNames:@"title", nil];
    [propertySet bindProperty:@"title" toKey:@"firstTitle"];
    return propertySet;
}

@end
