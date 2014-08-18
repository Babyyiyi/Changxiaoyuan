//
//  HeaderParallax.h
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-15.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HeaderParallax : NSObject

@property (strong, nonatomic) UIImageView *view;
@property (strong, nonatomic) UITableView *tableView;

- (void)stretchHeaderForTableView:(UITableView*)tableView withView:(UIImageView*)view;
- (void)scrollViewDidScroll:(UIScrollView*)scrollView;
- (void)resizeView;

@end
