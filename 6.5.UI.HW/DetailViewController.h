//
//  DetailViewController.h
//  6.5.UI.HW
//
//  Created by rimi on 15/6/5.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, strong) NSString *phoneNumber;

//创建通知的时间和通话记录
@property(strong, nonatomic) NSString               *time; //通话时间
@property(strong, nonatomic) NSMutableDictionary    *date; //通话记录数据字典

@end
