//
//  ViewController.h
//  6.5.UI.HW
//
//  Created by rimi on 15/6/5.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewControllDelegate <NSObject>

- (void)buttonDidPressed:(NSString *)text;

@end

@interface ViewController : UIViewController

@property (assign, nonatomic) id<ViewControllDelegate> delegate;

@end

