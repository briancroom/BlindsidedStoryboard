#import "EmbeddedViewController.h"

@interface EmbeddedViewController ()
@property (nonatomic, strong) id<BSInjector> injector;
@property (nonatomic, strong) UIColor *backgroundColor;
@end

@implementation EmbeddedViewController

+ (BSPropertySet *)bsProperties {
    BSPropertySet *propertySet = [BSPropertySet propertySetWithClass:self propertyNames:@"backgroundColor", nil];
    [propertySet bindProperty:@"backgroundColor" toKey:@"embeddedColor"];
    return propertySet;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = self.backgroundColor;
}

@end
