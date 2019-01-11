// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "KWLCoolViewCell.h"

CGPoint KWLTextOrigin = { 12, 8 };

@interface KWLCoolViewCell ()
@property (assign, nonatomic, getter=isHighlighted) BOOL highlighted;
@property (class, strong, nonatomic, readonly) NSDictionary *textAttributes;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@end

@implementation KWLCoolViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame])) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizers];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (!(self = [super initWithCoder:aDecoder])) return nil;
    
    [self configureLayer];
    
    return self;
}

- (void)prepareForInterfaceBuilder {
    self.layer.masksToBounds = YES;
}

- (void)configureLayer {
    self.layer.borderWidth = 3;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
}

- (void)configureGestureRecognizers {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bounce)];
    recognizer.numberOfTapsRequired = 2;
    [self addGestureRecognizer:recognizer];
}

+ (NSDictionary *)textAttributes {
    return @{ NSFontAttributeName: [UIFont systemFontOfSize:20.0],
              NSForegroundColorAttributeName: UIColor.whiteColor };
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}
- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    [self sizeToFit];
}

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    self.alpha = self.isHighlighted ? 0.5 : 1.0;
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = [self.text sizeWithAttributes:self.class.textAttributes];
    newSize.width += KWLTextOrigin.x * 2;
    newSize.height += KWLTextOrigin.y * 2;
    return newSize;
}

- (void)drawRect:(CGRect)rect {
    [self.text drawAtPoint:KWLTextOrigin withAttributes:self.class.textAttributes];
}

// MARK: - Animation methods

- (IBAction)bounce {
    NSLog(@"In %s", __func__);
    [self animateBounceWithDuration:1.0 size:CGSizeMake(120, 240)];
}

- (void)configureAnimation:(CGSize)size {
    [UIView setAnimationRepeatCount:3.5];
    [UIView setAnimationRepeatAutoreverses:YES];
    CGAffineTransform translation = CGAffineTransformMakeTranslation(size.width, size.height);
    self.transform = CGAffineTransformRotate(translation, M_PI_2);
}

- (void)configureBounceFinishWithDuration:(NSTimeInterval)duration size:(CGSize)size {
    [UIView animateWithDuration:duration animations:^{
        self.transform = CGAffineTransformIdentity;
    }];
}

- (void)animateBounceWithDuration:(NSTimeInterval)duration size:(CGSize)size {
    // TODO: Make this safer
    [UIView animateWithDuration:duration
                     animations:^{ [self configureAnimation:size]; }
                     completion:^(BOOL finished) { [self configureBounceFinishWithDuration:duration size:size]; }];
}

@end
                                          

// MARK: - Responder methods

@implementation KWLCoolViewCell (UIResponder)

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.superview bringSubviewToFront:self];
    self.highlighted = YES;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint currLocation = [touch locationInView:nil];
    CGPoint prevLocation = [touch previousLocationInView:nil];
    
    CGFloat deltaX = currLocation.x - prevLocation.x;
    CGFloat deltaY = currLocation.y - prevLocation.y;
    
    self.frame = CGRectOffset(self.frame, deltaX, deltaY);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

@end
