//
//  BookTableViewCell.h
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-5.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *bookname;
@property (weak, nonatomic) IBOutlet UILabel *isbn;
@property (weak, nonatomic) IBOutlet UILabel *author;

@end
