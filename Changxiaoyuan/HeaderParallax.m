//
//  HeaderParallax.m
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-15.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import "HeaderParallax.h"

@interface HeaderParallax ()
{
    CGFloat defaultFrameHeight;
    CGRect initFrame;
}
@end

@implementation HeaderParallax

- (void)stretchHeaderForTableView:(UITableView*)tableView withView:(UIImageView*)view
{
    _tableView = tableView;
    _view = view;
    
    initFrame = view.frame;
    defaultFrameHeight = initFrame.size.height;
    
    UIView *header = [[UIView alloc] initWithFrame:initFrame];
    _tableView.tableHeaderView = header;
    
    [_tableView addSubview:_view];
}
- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    CGRect f = _view.frame;
    f.size.width = _tableView.frame.size.width;
    _view.frame = f;
    NSLog(@"%f",f.origin.y);
    
    if (scrollView.contentOffset.y < 0) {
        CGFloat offsetY = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
        initFrame.origin.y = offsetY * -1;
        initFrame.size.height = defaultFrameHeight + offsetY;
        _view.frame = initFrame;
    }
}
- (void)resizeView
{
    initFrame.size.width = _tableView.frame.size.width;
    _view.frame = initFrame;
}
@end
