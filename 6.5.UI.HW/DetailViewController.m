//
//  DetailViewController.m
//  6.5.UI.HW
//
//  Created by rimi on 15/6/5.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
{
    NSTimer *_timer;
}

- (void)initializeUserInterface;
- (void)handleButtonEvent:(UIButton *)sender;
- (void)handleOverButtonEvent:(UIButton *)sender;

// 开始
- (void)startTimer;
// 暂停
- (void)pauseTimer;
// 停止
- (void)stopTimer;
// 处理Timer事件
- (void)handleTimer;


@end

@implementation DetailViewController

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeUserInterface];
    [self startTimer];
    
    
}

- (void)initializeUserInterface
{
    self.date = [NSMutableDictionary dictionary];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //显示电话号
    UILabel * numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,
                                                                      CGRectGetWidth(self.view.bounds), 60)];
    [numberLabel setCenter:CGPointMake(CGRectGetMidX(self.view.bounds),
                                       CGRectGetMinY(self.view.bounds) + 60)];
    [numberLabel setText:_phoneNumber];
    [numberLabel setTextAlignment:NSTextAlignmentCenter];
    [numberLabel setFont:[UIFont systemFontOfSize:30]];
    [self.view addSubview:numberLabel];
    
    //显示timer时间
    UILabel * showTimerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,
                                                                         CGRectGetWidth(self.view.bounds), 60)];
    [showTimerLabel setCenter:CGPointMake(CGRectGetMidX(self.view.bounds),
                                          CGRectGetMaxY(numberLabel.frame) + 50)];
    [showTimerLabel setText:@"00:00:00"];
    [showTimerLabel setTextAlignment:NSTextAlignmentCenter];
    [showTimerLabel setBackgroundColor:[UIColor whiteColor]];
    [showTimerLabel setTag:100];
    [self.view addSubview:showTimerLabel];
    
    //显示通话界面
    NSArray * imgs = @[@"free_call_通话_扬声器_正常状态", @"free_call_通话_键盘_正常状态", @"free_call_通话_静音_正常状态"];
    NSArray * selImages = @[@"free_call_通话_扬声器_按下状态", @"free_call_通话_键盘_按下状态", @"free_call_通话_静音_按下状态"];
    
    for (int i = 0; i < 3; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(60 + i * 100 , CGRectGetMidY(self.view.bounds) / 2 + 30, 60, 60)];
        [button setBackgroundImage:[UIImage imageNamed:imgs[i]] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:selImages[i]] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(handleButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
    }
    
    //挂断
    UIButton * overButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [overButton setBounds:CGRectMake(0, 0, 60, 60)];
    [overButton setCenter:CGPointMake(CGRectGetMidX(self.view.bounds), 400)];
    [overButton setBackgroundImage:[UIImage imageNamed:@"free_call_通话_挂断_正常状态"] forState:UIControlStateNormal];
    [overButton setBackgroundImage:[UIImage imageNamed:@"free_call_通话_挂断_按下状态"] forState:UIControlStateHighlighted];
    [overButton addTarget:self
                   action:@selector(handleOverButtonEvent:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:overButton];
    
    
}



- (void)handleButtonEvent:(UIButton *)sender
{
    sender.selected = !sender.selected;
}

- (void)handleOverButtonEvent:(UIButton *)sender
{
    //将电话号码添加到字典
    [self.date setObject:self.phoneNumber forKey:@"number"];
    //将通话时间添加到字典
    [self.date setObject:self.time forKey:@"time"];
    
    
    //创建通知
    NSNotification  *notification = [NSNotification notificationWithName:@"receiveNews" object:self.date];
    //发出通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
        [self stopTimer];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - NSTimer methods

- (void)startTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1
                                              target:self
                                            selector:@selector(handleTimer)
                                            userInfo:nil
                                             repeats:YES];
}
- (void)pauseTimer
{
    _timer.fireDate = [NSDate distantFuture];
}
- (void)stopTimer
{
    [_timer invalidate];
    _timer = nil;
}
- (void)handleTimer
{
    // 通过标签获取视图
    UILabel *showTimeLabel = (UILabel *)[self.view viewWithTag:100];
    // 获取标签的文本
    NSString *timeString = showTimeLabel.text;
    // 创建日期格式化对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // 设置样式
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    // 转换成date
    NSDate *date = [dateFormatter dateFromString:timeString];
    // 在此基础上加1s
    date = [date dateByAddingTimeInterval:1];
    // 最终转换成文本即可
    showTimeLabel.text = [dateFormatter stringFromDate:date];
    self.time = showTimeLabel.text;
}


@end
