//
//  DisplayViewController.m
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-13.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import "DisplayViewController.h"

@interface DisplayViewController (){
    UIScrollView *scrollview;
    UIPageControl *pageControl;
    NSInteger width;
    NSInteger hight;
}

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation DisplayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        width = self.view.bounds.size.width;
        hight = self.view.bounds.size.height;
        scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, width, 240)];
        [scrollview setDelegate:self];
        for (int i = 1;i < 4;i++) {
            NSString *fileName = [NSString stringWithFormat:@"%d.png",i];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:fileName]];
            [imageView setFrame:CGRectMake((i-1)*width, 0, width, 240)];
            [scrollview  addSubview:imageView];
        }
        [scrollview setContentSize:CGSizeMake(width*3, 240)];
        [scrollview setBounces:NO];
        
        [scrollview setShowsHorizontalScrollIndicator:NO];
        [scrollview setShowsVerticalScrollIndicator:NO];
        
        [scrollview setPagingEnabled:YES];
        
        pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 220, 320, 20)];
        [pageControl setBackgroundColor:[UIColor clearColor]];
        pageControl.currentPage = 0;
        pageControl.numberOfPages = 3;
        
        [self.view addSubview:scrollview];
        [self.view addSubview:pageControl];
    }
    return self;
}

- (void)viewDidLoad
{
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(autoDisplay) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)autoDisplay
{
    NSInteger index= scrollview.contentOffset.x/width;
    NSInteger nextIndex = (scrollview.contentOffset.x + width)/width;
    
    if (nextIndex > 2) {
        [scrollview setContentOffset:CGPointMake(0, 0) animated:YES];
        [pageControl setCurrentPage:0];
    }else{
        [scrollview setContentOffset:CGPointMake(scrollview.contentOffset.x + width, 0) animated:YES];
        [pageControl setCurrentPage:index];
    }
}

#pragma mark - Scroll delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
{
    int index= scrollview.contentOffset.x/width;
    [pageControl setCurrentPage:index];
    
    
}
@end
