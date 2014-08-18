//
//  ModifyViewController.h
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-1.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModifyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *oldPassword;
@property (weak, nonatomic) IBOutlet UITextField *nowPassword;
@property (weak, nonatomic) IBOutlet UITextField *again;

- (IBAction)submit:(id)sender;
@end
