//
//  LoginViewController.h
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-1.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UILabel *tips;
@property (strong, nonatomic) UIActivityIndicatorView *progress;

- (IBAction)Signup:(id)sender;

@end
