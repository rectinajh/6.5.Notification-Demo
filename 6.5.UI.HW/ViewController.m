//
//  ViewController.m
//  6.5.UI.HW
//
//  Created by rimi on 15/6/5.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "ViewController.h"
#import "SettingViewController.h"

@interface ViewController ()<UITextFieldDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) UITextField *usernameTextField;
@property (strong, nonatomic) UITextField *passwordTextField;
@property (strong, nonatomic) UIActivityIndicatorView *indicatorView;


//初始化界面
- (void)initializeUserInterface;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initializeUserInterface];
}

- (void)initializeUserInterface
{
    
    
    self.title = @"登录";
    self.view.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:2];
    
    
#pragma maik - 创建头像
    
    //创建头像
    UIImageView *headImageView = [[UIImageView alloc] init];
    
    //设置大小
    headImageView.bounds = CGRectMake(0, 0, 110,100);
    
    //获取父视图的x中心点
    CGFloat centerX = CGRectGetMidX(self.view.bounds);
    
    //设置y的中心点
    CGFloat centerY = 150;
    headImageView.center = CGPointMake(centerX, centerY);
    
    //设置图片
    UIImage *image = [UIImage imageNamed:@"9.jpg"];
    
    //关联图片
    headImageView.image = image;
    
    //设置圆形
    headImageView.layer.cornerRadius = 50;
    
    //进行裁剪
    headImageView.clipsToBounds = YES;
    
    //添加到父视图
    [self.view addSubview:headImageView];
    
    // UIImageView特效
    // 设置缩放方式
    headImageView.contentMode = UIViewContentModeScaleToFill;
    
    // 栅格化数据试讲矢量图变为位图，如果层中的内容是变动的，每次都需要栅格化，就会影响效率。一般设置为NO
    [headImageView.layer setShouldRasterize:YES];
    
    // 设置边框颜色
    [headImageView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    
    // 设置边框宽度
    [headImageView.layer setBorderWidth:2.0];
    
    // 设置投影偏移量，CGSizeMake
    [[headImageView layer] setShadowOffset:CGSizeMake(1, 1)];
    
    // 设置投影颜色
    [[headImageView layer] setShadowColor:[UIColor redColor].CGColor];
    
    // 设置投影半径
    [[headImageView layer] setShadowRadius:3];
    
    // 设置透明度
    [[headImageView layer] setShadowOpacity:0.9];
    
    // 圆角外的区域将被遮盖。与cornerradius使用，
    [headImageView.layer setMasksToBounds:YES];
    headImageView.layer.cornerRadius = 10;
    
    
    
#pragma maik - 创建账号textField
    
    self.usernameTextField = [[UITextField alloc] init];
    
    //获取父视图width
    CGFloat width = CGRectGetWidth(self.view.bounds);
    
    //设置位置
    self.usernameTextField.frame = CGRectMake(0, 300, width, 30);
    
    //设置边框
    self.usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    //设置提示语
    self.usernameTextField.placeholder = @"密码";
    
    //设置对齐方式
    self.usernameTextField.textAlignment = NSTextAlignmentCenter;
    
    //设置自动大小写
    self.usernameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    // 获取字体家族
    NSLog(@"%@",[UIFont familyNames]);
    
    // 字体
    self.usernameTextField.font =[UIFont fontWithName:@"Heiti SC" size:20];
    
    //设置进行纠正
    self.usernameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    //设置代理
    self.usernameTextField.delegate = self;
    
    //配置清空代理
    self.usernameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    //添加到父视图
    [self.view addSubview:self.usernameTextField];
    
    
#pragma maik - 创建密码textField
    
    self.passwordTextField = [[UITextField alloc] init];
    
    //设置位置
    self.passwordTextField.frame = CGRectMake(0, 265, width, 30);
    
    //设置边框
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    //设置提示语
    self.passwordTextField.placeholder = @"QQ号/手机号/邮箱";
    
    //设置对齐方式
    self.passwordTextField.textAlignment = NSTextAlignmentCenter;
    
    //设置自动大小写
    self.passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    //设置进行纠正
    self.passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    //影藏密码
    self.passwordTextField.secureTextEntry = YES;
    
    //设置代理
    self.passwordTextField.delegate = self;
    
    //配置清空代理
    self.passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    //添加到父视图
    [self.view addSubview:self.passwordTextField];
    
    
#pragma maik - 添加登录按钮
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //设置大小
    loginButton.bounds = CGRectMake(0, 0, 200, 30);
    
    //设置中心点
    loginButton.center = CGPointMake(width/2, 400);
    
    //设置背景颜色
    loginButton.backgroundColor = [UIColor grayColor];
    
    //设置标题
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    
    //设置标题字体颜色
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //添加执行事件
    [loginButton addTarget:self action:@selector(handleButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    // 设置大小
    loginButton.bounds = CGRectMake(0, 300, 170, 30);
    // 设置中心点
    loginButton.center = CGPointMake(width / 2, 400);
    // 添加父视图
    [self.view addSubview:loginButton];
    // 设置button的圆角
    loginButton.layer.cornerRadius = 10;
    
    //添加到父视图
    [self.view addSubview:loginButton];
    
}

//限制字符串长度
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length + string.length > 10) {
        
        return NO;
    }
    return YES;
}


//点击return取消虚拟键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //失去焦点
    [textField resignFirstResponder];
    return YES;
}


//点击空白处取消虚拟键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
}


//登录按钮触发事件
- (void)handleButtonEvent:(UIButton *)sender
{
    //执行时取消虚拟键盘
    [self.view endEditing:YES];
    
    //添加活动指示器
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicatorView setBounds:CGRectMake(0, 0, 30, 30)];
    [indicatorView setCenter:CGPointMake(190, 350)];
    [self.view addSubview:indicatorView];
    
    //设置停止的时候是否影藏（默认是YES）
    indicatorView.hidesWhenStopped = YES;
    
    //开启动画
    [indicatorView startAnimating];
    
    //进行关联
    self.indicatorView = indicatorView;
    
    //判断用户名和密码是否正确
    if ([[NSString stringWithFormat:@"admin"] isEqualToString:_usernameTextField.text] && [[NSString stringWithFormat:@"123456"] isEqualToString:_passwordTextField.text]) {
        
        //延迟调用方法
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            if (self.delegate && [self.delegate conformsToProtocol:@protocol(ViewControllDelegate)]) {
                [self.delegate buttonDidPressed:_usernameTextField.text];
            }
            
            //视图跳转
            [self.navigationController popToRootViewControllerAnimated:YES];
            
            //关闭动画
            [self.indicatorView stopAnimating];
            
        });
        
    } else if ([self.usernameTextField.text length] == 0 || [self.passwordTextField.text length] == 0) {
        
        //关闭动画
        [self.indicatorView stopAnimating];
        
        //警告框，需要遵守协议：<UIAlertViewDelegate>
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入用户名和密码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        
        //展示
        [alertView show];
        
    } else {
        
        //延迟调用方法
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            //关闭动画
            [self.indicatorView stopAnimating];
            
            //警告框
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名和密码错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            
            //展示
            [alertView show];
            
        });
    }
}

@end
