//
//  DialTableViewCell.h
//  6.5.UI.HW
//
//  Created by rimi on 15/6/11.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DialTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *phoneNumber;
@property (strong, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UILabel *Operator;
@property (strong, nonatomic) IBOutlet UILabel *date;

@end
