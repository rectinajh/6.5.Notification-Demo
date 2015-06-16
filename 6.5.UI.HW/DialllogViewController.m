//
//  DialllogViewController.m
//  6.5.UI.HW
//
//  Created by rimi on 15/6/5.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "DialllogViewController.h"
#import "DialTableViewCell.h"


@interface DialllogViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(strong, nonatomic) UITableView            *tableView;   //表格视图
@property(strong, nonatomic) NSMutableArray          *numberArray; //电话号码数组
@property(strong, nonatomic) NSMutableArray          *timeArray;   //通话时间数组

- (void)initlializeDataSource;
- (void)initlializeUserInterface;

@end

//重建重用标识符
static NSString *identifier = @"Cell";

@implementation DialllogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initlializeDataSource];
    [self initlializeUserInterface];
}

- (void)initlializeDataSource
{
    
    self.numberArray = [NSMutableArray array];  //初始化电话号码数组
    self.timeArray   = [NSMutableArray array];  //初始哈通话时间数组
    
    //接收通知消息
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receiveNews:) name:@"receiveNews" object:nil];

}
- (void)initlializeUserInterface
{
    self.title = @"通话记录";
    //创建tabview
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tableView.dataSource = self;//设置dataSource数据源
    self.tableView.rowHeight = 40;//设置属性
    self.tableView.delegate = self;//设置代理
    [self.view addSubview:self.tableView]; //添加到父类视图中
    
    //进行xib文件注册                             //必须和xib文件名一致
    [self.tableView registerNib:[UINib nibWithNibName:@"DialTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
    
    

}

//响应通知事件
- (void)receiveNews:(NSNotification *)notification {
    
    [self.numberArray addObject:[notification.object objectForKey:@"number"]];
    [self.timeArray addObject:[notification.object objectForKey:@"time"]];

    [self.tableView reloadData];
}

//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.numberArray.count;
}

//配置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建cell
    DialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if (!cell) {
        //创建一个以当前重用标识符的cell
        cell = [[DialTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    //取出传来的元素
    NSString *phoneNum = self.numberArray[indexPath.row]; //获取电话号码数组中相应行的的号码
    NSString *time = self.timeArray[indexPath.row];         //获取通话时间数组中响应的电话号码
    cell.phoneNumber.text = phoneNum; //设置文本标签获取电话号码
    cell.time.text = [NSString stringWithFormat:@"%@",time]; //设置文本标签获取通话记录
    
    NSString  *phone = [phoneNum substringToIndex:1];
    NSInteger number = [phone integerValue]; //NSString 转换成 NSInteger
    
    //通过判断数字给operator赋值，默认是未知
    if (number >= 7 && number <=9) {
        cell.Operator.text = @"中国移动";
    } else if(number >=0 && number <= 7) {
        cell.Operator.text = @"中国联通";
    }
    return cell;

}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
