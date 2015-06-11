//
//  SettingViewController.m
//  6.5.UI.HW
//
//  Created by rimi on 15/6/5.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "SettingViewController.h"
#import "ViewController.h"


@interface SettingViewController ()<ViewControllDelegate>

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UILabel  *userNameLabel;

- (void)handleButtonEvent:(UIButton *)sender;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeUserInterface];
}

- (void)initializeUserInterface
{
    
    self.title = @"主页";
    
    self.view.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:2];
    
#pragma mark - 创建注销按钮
    
    //创建返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    //    backButton.tag = 50;
    _backButton = backButton;
    backButton.hidden = YES;
    
    //设置标题
    [backButton setTitle:@"注销" forState:UIControlStateNormal];
    
    //设置大小
    backButton.bounds = CGRectMake(0, 0, 100, 30);
    
    CGFloat width = CGRectGetWidth(self.view.bounds);
    
    //设置中心点
    backButton.center = CGPointMake(width/2, 320);
    
    //添加事件
    [backButton addTarget:self action:@selector(handleButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //添加到视图
    [self.view addSubview:backButton];
    
    
#pragma maik - 添加登录按钮
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    loginButton.tag = 50;
    _loginButton = loginButton;
    loginButton.hidden = NO;
    
    //设置大小
    loginButton.bounds = CGRectMake(0, 0, 200, 30);
    
    //设置中心点
    loginButton.center = CGPointMake(width/2, 320);
    
    //设置标题
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    
    //添加执行事件
    [loginButton addTarget:self action:@selector(handleButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    //添加到父视图
    [self.view addSubview:loginButton];
    
}

- (void)handleButtonEvent:(UIButton *)sender
{
    
    ViewController *VC = [[ViewController alloc] init];
    
    VC.delegate = self;
    if (sender.tag == 50) {
        
        [self.navigationController pushViewController:VC animated:YES];
        
    } else {
        _userNameLabel.text = nil;
        _backButton.hidden = YES;
        _loginButton.hidden = NO;
    }
    
    
}

- (void)buttonDidPressed:(NSString *)text
{
    
    //显示用户名
    UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,100, 60)];
    
    //关联
    _userNameLabel = userNameLabel;
    
    //设置中心点
    [userNameLabel setCenter:CGPointMake(190,200)];
    
    //文本对齐
    [userNameLabel setTextAlignment:NSTextAlignmentCenter];
    
    //字体大小
    [userNameLabel setFont:[UIFont systemFontOfSize:30]];
    
    //接收
    _userNameLabel.text = text;
    
    //添加到父视图
    [self.view addSubview:_userNameLabel];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_userNameLabel.text != nil) {
        
        _backButton.hidden = NO;
        _loginButton.hidden = YES;
        
    } else {
        
        _backButton.hidden = YES;
        _loginButton.hidden = NO;
    }
    
}

@end
