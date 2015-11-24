//
//  NotificationViewController.m
//  DataTrans
//
//  Created by MC on 15/11/23.
//  Copyright © 2015年 MC. All rights reserved.
//

#import "NotificationViewController.h"

@interface NotificationViewController ()

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 100, 100, 20)];
    label.text = @"NSNotification";
    label.font = [UIFont systemFontOfSize:13.0f];
    [self.view addSubview: label];
}

@end
