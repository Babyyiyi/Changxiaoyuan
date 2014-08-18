//
//  UserViewController.h
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-5.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *classname;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UIButton *submit;

- (IBAction)quit:(id)sender;
- (IBAction)submit:(id)sender;
@end
