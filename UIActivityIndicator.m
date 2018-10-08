//
//  UIActivityButton.m
//  Created by Javier Torrón Díaz on 19/9/18.
// This code is licensed under MIT license (see LICENSE.txt for details)
//

#import "UIActivityButton.h"

@implementation UIActivityButton

/*
 *  Constructor for creating button programatically
 */
- (instancetype) initWithColor:(UIColor*)color {
    self = [super init];
    if (self) {
        self.spinnerColor = color;
    }
    
    return self;
}

// ----------------- Public methods
/*
 *  Saves the title, UIEdgeInsets and Image in local vars, in order to return them when indicator stops
 */
- (void) showLoading {
    self.isLoading = YES;
    self.buttonTitle = self.titleLabel.text;
    imageInsets = self.imageEdgeInsets;
    titleInsets = self.titleEdgeInsets;
    buttonImage = self.imageView.image;
    [self setImage:nil forState:UIControlStateNormal];
    imageViewContentMode = self.imageView.contentMode;
    [self setTitle:@"" forState:UIControlStateNormal];
    if (self.spinner == nil) {
        self.spinner = [self createActivityIndicator];
    }
    [self showSpinning];
}

/*
 *  Hides the spinner and resets the title, image and UIEdgeInsets for reloading button previous state
 */
- (void) hideLoading {
    self.isLoading = NO;
    [self.spinner stopAnimating];
    [self setTitle:self.buttonTitle forState:UIControlStateNormal];
    self.imageEdgeInsets = imageInsets;
    self.titleEdgeInsets = titleInsets;
    [self setImage:buttonImage forState:UIControlStateNormal];
}

// ----------------- Private methods
- (UIActivityIndicatorView*) createActivityIndicator {
    UIActivityIndicatorView *tempSpinner = [[UIActivityIndicatorView alloc] init];
    tempSpinner.hidesWhenStopped = YES;
    if (self.spinnerColor == nil) {
        self.spinnerColor = [UIColor whiteColor];
    }
    tempSpinner.color = self.spinnerColor;
    return tempSpinner;
}

- (void) showSpinning {
    self.spinner.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.spinner];
    [self centerActivityIndicatorInButton];
    [self.spinner startAnimating];
}

/*
 *  Creates constraints for centering the activity indicator on the button
 */
- (void) centerActivityIndicatorInButton {
    NSLayoutConstraint *horizontalCenterConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                                  attribute:NSLayoutAttributeCenterX
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self.spinner
                                                                                  attribute:NSLayoutAttributeCenterX
                                                                                 multiplier:1
                                                                                   constant:0];
    NSLayoutConstraint *verticalCenterConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                                  attribute:NSLayoutAttributeCenterY
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self.spinner
                                                                                  attribute:NSLayoutAttributeCenterY
                                                                                 multiplier:1
                                                                                   constant:0];
    [self addConstraint:horizontalCenterConstraint];
    [self addConstraint:verticalCenterConstraint];
}

@end
