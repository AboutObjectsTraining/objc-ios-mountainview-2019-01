#import "KWLCoolController.h"
#import "KWLCoolView.h"

@implementation KWLCoolController

- (void)loadView {
    UIView *backgroundView = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    self.view = backgroundView;
    
    UIView *subview1 = [[KWLCoolView alloc] initWithFrame:CGRectMake(20, 100, 200, 40)];
    UIView *subview2 = [[KWLCoolView alloc] initWithFrame:CGRectMake(50, 150, 200, 40)];
    
    [backgroundView addSubview:subview1];
    [backgroundView addSubview:subview2];
    
    backgroundView.backgroundColor = UIColor.brownColor;
    subview1.backgroundColor = UIColor.purpleColor;
    subview2.backgroundColor = UIColor.orangeColor;
}


@end
