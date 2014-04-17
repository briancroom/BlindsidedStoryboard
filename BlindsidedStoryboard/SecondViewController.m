#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic, strong) id<BSInjector> injector;
@end

@implementation SecondViewController

+ (BSPropertySet *)bsProperties {
    BSPropertySet *propertySet = [BSPropertySet propertySetWithClass:self propertyNames:@"title", nil];
    [propertySet bindProperty:@"title" toKey:@"secondTitle"];
    return propertySet;
}

@end
