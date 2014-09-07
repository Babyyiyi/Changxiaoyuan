//
//  LoginViewController.m
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-1.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import "LoginViewController.h"
#import "UserViewController.h"
#import "UserinfoViewController.h"

#import <UIViewController+MMDrawerController.h>

@interface LoginViewController ()


@end

@implementation LoginViewController

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
    _username.delegate = self;
    _password.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Signup:(id)sender {
    if ([self.username.text length] != 0 && [self.password.text length] != 0) {
        NSString *username = self.username.text;
        NSString *password = self.password.text;
        
        _progress = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(140, 238, 40, 40)];
        [_progress setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [self.view addSubview:_progress];
        [_progress startAnimating];
        NSString *urlString = [NSString stringWithFormat:@"http://xiyou.changxiaoyuan.com/api/?callback=&username=%@&do=user&password=%@&appkey=4107762472",username,password];
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        
        AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        op.responseSerializer = [AFJSONResponseSerializer serializer];
        [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            [_progress stopAnimating];
            NSDictionary *dic = (NSDictionary *)responseObject;
            if ((BOOL)[dic objectForKey:@"error"]) {
                self.tips.hidden = NO;
            }else{
                [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"loginState"];
                [[NSUserDefaults standardUserDefaults] setObject:username forKey:@"username"];
                [[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];
                [self.mm_drawerController setCenterViewController:[[UserinfoViewController alloc] init]
                                               withCloseAnimation:YES
                                                       completion:nil];
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
        [[NSOperationQueue mainQueue] addOperation:op];
    }else{
        self.username.placeholder = @"请输入用户名";
        self.password.placeholder = @"请输入密码";
        [self.username setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
        [self.password setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    }
   
}

#pragma mark textField delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.tips.hidden = YES;
}
@end
