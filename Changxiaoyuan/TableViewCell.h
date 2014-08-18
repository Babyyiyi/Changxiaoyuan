//
//  TableViewCell.h
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-4.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *nickname;

@end
