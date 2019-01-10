#import "KWLCoolController.h"
#import "KWLCoolView.h"

@interface KWLCoolController () <UITextFieldDelegate>
@property (strong, nonatomic) UITextField *textField;
@property (weak, nonatomic) UIView *contentView;
@end

// TODO: Refactor me!!!
@implementation KWLCoolController

- (void)addCoolView {
    NSLog(@"In %s, text is %@", __func__, self.textField.text);
    KWLCoolView *newCoolView = [[KWLCoolView alloc] init];
    newCoolView.text = self.textField.text;
    [self.contentView addSubview:newCoolView];
}

- (void)loadView {
    UIView *backgroundView = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    self.view = backgroundView;
    
    CGRect accessoryRect;
    CGRect contentRect;
    CGRectDivide(backgroundView.frame, &accessoryRect, &contentRect, 90.0, CGRectMinYEdge);
    UIView *accessoryView = [[UIView alloc] initWithFrame:accessoryRect];
    UIView *contentView = [[UIView alloc] initWithFrame:contentRect];
    
    self.contentView = contentView;
    
    [backgroundView addSubview:accessoryView];
    [backgroundView addSubview:contentView];
    
    // Controls
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 45, 240, 30)];
    [accessoryView addSubview:self.textField];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Enter some text.";
    
    self.textField.delegate = self;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [accessoryView addSubview:button];
    [button setTitle:@"Add" forState:UIControlStateNormal];
    [button sizeToFit];
    button.frame = CGRectOffset(button.frame, 270, 45);
    
    [button addTarget:self action:@selector(addCoolView) forControlEvents:UIControlEventTouchUpInside];
    
    // CoolViews
    
    KWLCoolView *subview1 = [[KWLCoolView alloc] initWithFrame:CGRectMake(20, 40, 200, 40)];
    KWLCoolView *subview2 = [[KWLCoolView alloc] initWithFrame:CGRectMake(50, 100, 200, 40)];
    
    subview1.text = @"Hello World! 🌎";
    subview2.text = @"We ❤️ Cool Views, they're great!";
        
    [contentView addSubview:subview1];
    [contentView addSubview:subview2];
    
    contentView.clipsToBounds = YES;
    
    backgroundView.backgroundColor = UIColor.brownColor;
    subview1.backgroundColor = UIColor.purpleColor;
    subview2.backgroundColor = UIColor.orangeColor;
    accessoryView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
    contentView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"In %s", __func__);
    [textField resignFirstResponder];
    return YES;
}

@end
