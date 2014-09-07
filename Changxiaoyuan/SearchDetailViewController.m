//
//  SearchDetailViewController.m
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-7.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import "SearchDetailViewController.h"
#import "SearchTableViewController.h"
#import <UIViewController+MMDrawerController.h>

@interface SearchDetailViewController ()

@end

@implementation SearchDetailViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationItem.backBarButtonItem.title = @"返回";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.delegate setValue:_detail];
    
//    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
//    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:_detail.bookname];
//    UIBarButtonItem *barButtonItemleft = [[UIBarButtonItem alloc] initWithTitle:@"返回"
//                                                                          style:UIBarButtonItemStyleBordered
//                                                                         target:self
//                                                                         action:@selector(backSearchTable)];
////    UIBarButtonItem *barButtonItemRight = [[UIBarButtonItem alloc] initWithTitle:@"豆瓣"
////                                                                           style:UIBarButtonItemStyleBordered
////                                                                          target:self
////                                                                          action:@selector(doubanbooks)];
//    navigationItem.leftBarButtonItem = barButtonItemleft;
////    navigationItem.rightBarButtonItem = barButtonItemRight;
//    navigationBar.items = @[navigationItem];
//    [self.view addSubview:navigationBar];
    
    _detailid.text = _detail.detailid;
    NSString *all = [[NSString alloc] init];
    NSString *on = [[NSString alloc] init];
    NSString *shuku = [[NSString alloc] init];
    
    all = [_detail.changan objectForKey:@"all"];
    on = [_detail.changan objectForKey:@"on"];
    shuku = [_detail.changan objectForKey:@"shuku"];
    _changan.text = [NSString stringWithFormat:@"总数%@,可借%@,书库%@",all,on,shuku];
    
    all = [_detail.yanta objectForKey:@"all"];
    on = [_detail.yanta objectForKey:@"on"];
    shuku = [_detail.yanta objectForKey:@"shuku"];
    _yanta.text = [NSString stringWithFormat:@"总数%@,可借%@,书库%@",all,on,shuku];

    if (!_detail.resume) {
        _resume.text = @"暂无简介";
    }else{
        _resume.text = [_detail.resume objectForKey:@"$t"];
    }
    
    NSString *urlString = [_detail.imageArray objectForKey:@"@href"];
    NSURL *url = [NSURL URLWithString:urlString];
    
    _image.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doubanbooks
{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 44, 320, 504)];
    NSString *urlString = [_detail.dblink objectForKey:@"@href"];
    NSLog(@"%@",urlString);
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
}
@end
