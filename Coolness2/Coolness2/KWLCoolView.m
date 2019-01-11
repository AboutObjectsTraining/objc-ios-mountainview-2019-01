// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "KWLCoolView.h"
#import "KWLCoolViewCell.h"

@interface KWLCoolView ()
@property (strong, nonatomic) IBOutlet UITextField *textField;
@end

@implementation KWLCoolView

- (IBAction)addCoolView {
    NSLog(@"In %s, text is %@", __func__, self.textField.text);
    KWLCoolViewCell *newCoolView = [[KWLCoolViewCell alloc] init];
    newCoolView.text = self.textField.text;
    [self addSubview:newCoolView];
}

@end
