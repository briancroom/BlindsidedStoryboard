#import "FirstViewController.h"
#import <Blindside/Blindside.h>

@interface FirstViewController ()
@property (nonatomic, strong) id<BSInjector> injector;
@end

@implementation FirstViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

+ (BSPropertySet *)bsProperties {
    BSPropertySet *propertySet = [BSPropertySet propertySetWithClass:self propertyNames:@"title", nil];
    [propertySet bindProperty:@"title" toKey:@"firstTitle"];
    return propertySet;
}

@end
