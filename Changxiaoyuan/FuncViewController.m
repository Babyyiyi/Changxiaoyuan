//
//  FuncViewController.m
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-14.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import "FuncViewController.h"
#import "LoginViewController.h"
#import <UIViewController+MMDrawerController.h>

@interface FuncViewController ()

@end

@implementation FuncViewController

- (void)loadView
{
    self.view = [[UIView alloc] init];
    UIButton *signUp1 = [[UIButton alloc] initWithFrame:CGRectMake(115.0, 340.0, 90.0, 30.0)];
    [signUp1 setImage:[UIImage imageNamed:@"signup.png"] forState:UIControlStateNormal];
    signUp1.adjustsImageWhenHighlighted = NO;
    self.view = signUp1;
    [signUp1 addTarget:self action:@selector(tapSignup) forControlEvents:UIControlEventTouchUpInside];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapSignup
{
    [self.mm_drawerController setCenterViewController:[[LoginViewController alloc] init] withCloseAnimation:YES completion:nil];
}
@end
