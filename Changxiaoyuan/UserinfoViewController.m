//
//  UserinfoViewController.m
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-6.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import "UserinfoViewController.h"
#import "LoginViewController.h"
#import <UIViewController+MMDrawerController.h>

@interface UserinfoViewController ()

@end

@implementation UserinfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _name.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
    _email.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"email"];
    _classname.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"classname"];
    _phone.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"phone"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:_name.text forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] setObject:_email.text forKey:@"email"];
    [[NSUserDefaults standardUserDefaults] setObject:_classname.text forKey:@"classname"];
    [[NSUserDefaults standardUserDefaults] setObject:_phone.text forKey:@"phone"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"修改成功!"
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}

- (IBAction)quit:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"loginState"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"password"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"email"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"classname"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"phone"];
    [self.mm_drawerController setCenterViewController:[[LoginViewController alloc] init] withCloseAnimation:YES completion:nil];
}
@end
