//
//  AppDelegate.m
//  6.5.UI.HW
//
//  Created by rimi on 15/6/5.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "AppDelegate.h"
#import "ContactViewController.h"
#import "DialllogViewController.h"
#import "DialViewController.h"
#import "SettingViewController.h"
#import "ViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //设置主窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
//    self.window.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:2];
    
    [self.window makeKeyAndVisible];
    //设置跟控制器
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    self.window.rootViewController = tabBarController;
    
    //创建控制器
    DialllogViewController *diallogViewController = [[DialllogViewController alloc]init];
    ContactViewController *contactViewController = [[ContactViewController alloc]init];
    DialViewController *dialViewController = [[DialViewController alloc]init];
    SettingViewController  *settingViewController = [[SettingViewController alloc]init];
    
    //设置栏设置成导航栏
    UINavigationController *navigationController =[[UINavigationController alloc]initWithRootViewController:settingViewController];
    UINavigationController *diallogViewController1 =[[UINavigationController alloc]initWithRootViewController:diallogViewController];
    
    
    //设置子控制器集合
    tabBarController.viewControllers =@[diallogViewController1,contactViewController,dialViewController,navigationController];
    
#pragma mark - 设置标签栏按钮
    //图片
    UIImage *calllogImage = [UIImage imageNamed:@"calllog2"];
    UIImage *contactImage = [UIImage imageNamed:@"contact3@3x"];
    UIImage *dialImage    = [UIImage imageNamed:@"dial1@3x"];
    UIImage *settingImage = [UIImage imageNamed:@"setting1@3x"];
    
    //配置文本颜色
    tabBarController.tabBar.tintColor = [UIColor greenColor];
    
    //标签栏颜色
    tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    
    
    //创建标签栏按钮
    UITabBarItem *contactItem  = [[UITabBarItem alloc] initWithTitle:@"通话记录" image:calllogImage tag:10];
    
    UITabBarItem *calllogItem  = [[UITabBarItem alloc] initWithTitle:@"联系人" image:contactImage tag:20];
    
    UITabBarItem *dialItem  = [[UITabBarItem alloc] initWithTitle:@"拨号" image:dialImage tag:30];
    
    UITabBarItem *settingItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:settingImage tag:40];
    
    
    //对应各个控制器
    diallogViewController.tabBarItem = contactItem;
    contactViewController.tabBarItem = calllogItem;
    dialViewController.tabBarItem = dialItem;
    settingViewController.tabBarItem = settingItem;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
