//
//  DelegateViewController.m
//  DataTrans
//
//  Created by MC on 15/11/23.
//  Copyright © 2015年 MC. All rights reserved.
//

#import "DelegateViewController.h"
#import "UserEntity.h"

@interface DelegateViewController ()
{
    UITextField *usr;
    UITextField *psd;
}

@end

@implementation DelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    usr = [[UITextField alloc]initWithFrame:(CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 100, 100, 20))];
    usr.borderStyle = UITextBorderStyleRoundedRect;
    psd = [[UITextField alloc]initWithFrame:(CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 130, 100, 20))];
    psd.borderStyle = UITextBorderStyleRoundedRect;
    UIButton* button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setFrame:(CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 160, 100, 20))];
    [button addTarget:self action:@selector(btnClicked) forControlEvents:(UIControlEventTouchUpInside)];
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"代理传值" forState:(UIControlStateNormal)];
    button.layer.cornerRadius = 5;
    [self.view addSubview:usr];
    [self.view addSubview:psd];
    [self.view addSubview:button];
}

- (void)btnClicked
{
    UserEntity *userEntity = [[UserEntity alloc]init];
    userEntity.usr = usr.text;
    userEntity.psd = psd.text;
    
    [self.delegate passValue: userEntity];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
