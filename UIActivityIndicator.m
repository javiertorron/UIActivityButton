//
//  UIActivityButton.m
//
//  Created by Javier Torrón Díaz on 19/9/18.
//  Copyright © 2018 Javier Torrón Díaz. All rights reserved.
//  
//  MIT License

//  Copyright (c) 2018 Javier Torron Diaz

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

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
