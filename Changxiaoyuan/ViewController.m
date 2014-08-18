//
//  ViewController.m
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-14.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import "ViewController.h"
#import "TitleViewController.h"
#import "DisplayViewController.h"
#import "FuncViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view = [[UIView alloc] init];
        self.view.backgroundColor = [UIColor whiteColor];
        
        TitleViewController *titleViewController = [[TitleViewController alloc] init];
        DisplayViewController *displayViewController = [[DisplayViewController alloc] init];
        FuncViewController *funcViewController = [[FuncViewController alloc] init];
        [self addChildViewController:titleViewController];
        [self addChildViewController:displayViewController];
        [self addChildViewController:funcViewController];
        [self.view addSubview:titleViewController.view];
        [self.view addSubview:displayViewController.view];
        [self.view addSubview:funcViewController.view];
    }
    return self;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
