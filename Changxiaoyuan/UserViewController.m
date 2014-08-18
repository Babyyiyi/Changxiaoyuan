//
//  UserViewController.m
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-5.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import "UserViewController.h"
#import "LoginViewController.h"

#import <UIViewController+MMDrawerController.h>

@interface UserViewController ()

@end

@implementation UserViewController

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
//    NSString * filePath = [self dataFilePath];
//    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
//        NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:filePath];
//        _name.text = [dic objectForKey:@"name"];
//        _email.text = [dic objectForKey:@"email"];
//        _classname.text = [dic objectForKey:@"classname"];
//        _phone.text = [dic objectForKey:@"phone"];
//    }
//    
//    UIApplication *app = [UIApplication sharedApplication];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(applicationWillResignActive:)
//                                                 name:UIApplicationWillResignActiveNotification
//                                               object:app];
}

- (void)applicationWillResignActive:(NSNotification *)notification
{
    NSString *filePath = [self dataFilePath];
    NSDictionary *dic = [[NSDictionary alloc] init];
    [dic setValue:_name.text forKey:@"name"];
    [dic setValue:_email.text forKey:@"email"];
    [dic setValue:_classname.text forKey:@"classname"];
    [dic setValue:_phone forKey:@"phone"];
    [dic writeToFile:filePath atomically:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)quit:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"loginState"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"password"];
    [self.mm_drawerController setCenterViewController:[[LoginViewController alloc] init] withCloseAnimation:YES completion:nil];
}

- (IBAction)submit:(id)sender {
    NSString *filePath = [self dataFilePath];
    NSDictionary *dic = [[NSDictionary alloc] init];
    [dic setValue:_name.text forKey:@"name"];
    [dic setValue:_email.text forKey:@"email"];
    [dic setValue:_classname.text forKey:@"classname"];
    [dic setValue:_phone forKey:@"phone"];
    [dic writeToFile:filePath atomically:YES];
    
    _submit.titleLabel.text = @"修改";
}

#pragma mark - save data
- (NSString *) dataFilePath
{
    NSArray *documentDirectories =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [documentDirectories objectAtIndex:0];
    return [documentsDirectory stringByAppendingString:@"user.plist"];
}
@end
