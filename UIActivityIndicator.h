//
//  UIActivityButton.h
//
//  Created by Javier Torrón Díaz on 19/9/18.
//  Copyright © 2018 Javier Torrón Díaz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActivityButton : UIButton{
    UIEdgeInsets imageInsets;
    UIEdgeInsets titleInsets;
    UIImage *buttonImage;
    UIViewContentMode imageViewContentMode;
}
// ------------------- Propiedades
@property (nonatomic) IBInspectable UIColor *spinnerColor;
@property (nonatomic) NSString *buttonTitle;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;
@property (nonatomic) BOOL isLoading;
// ------------------- Métodos
- (void) hideLoading;
- (void) showLoading;
@end
