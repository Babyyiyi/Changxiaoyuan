//
//  UserinfoViewController.h
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-6.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserinfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *classname;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UIButton *submit;

- (IBAction)submit:(id)sender;
- (IBAction)quit:(id)sender;

@end
