//
//  MainViewController.m
//  DataTrans
//
//  Created by MC on 15/11/20.
//  Copyright © 2015年 MC. All rights reserved.
//

#import "MainViewController.h"
#import "ForwardViewController.h"
#import "MethodViewController.h"
#import "UserEntity.h"
#import "DelegateViewController.h"
#import "BlockViewController.h"
#import "Singleton.h"
#import "SlngleViewController.h"
#import "NotificationViewController.h"

@interface MainViewController ()<UITextFieldDelegate>


@end

@implementation MainViewController

# pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesBegan:)];
    [self.view addGestureRecognizer:tap];
    
    
    // 前向后传值
    self.forward = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.forward setFrame: CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 100, 100, 20)];
    self.forward.backgroundColor = [UIColor lightGrayColor];
    [self.forward setTitle: @"前向后传值" forState: UIControlStateNormal];
    self.forward.layer.cornerRadius = 5;
    [self.forward addTarget: self action: @selector(forwardBtnClicked:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: self.forward];
    
    
    // 方法传值
    self.method = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.method setFrame: CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 130, 100, 20)];
    self.method.backgroundColor = [UIColor lightGrayColor];
    [self.method setTitle: @"方法传值" forState:UIControlStateNormal];
    self.method.tintColor = [UIColor blueColor];
    self.method.layer.cornerRadius = 5;
    [self.method addTarget: self action: @selector(methodBtnClicked:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: self.method];
    
    
    // delegate传值
    self.usr =  [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 180, 100, 20)];
    self.usr.text = @"usr";
    self.usr.textColor = [UIColor lightGrayColor];
    self.usr.textAlignment = NSTextAlignmentCenter;
    self.usr.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.usr.layer.borderWidth = 0.5f;
    self.usr.layer.cornerRadius = 5;
    [self.view addSubview: self.usr];
    
    self.psd = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 210, 100, 20)];
    self.psd.text = @"psd";
    self.psd.textColor = [UIColor lightGrayColor];
    self.psd.textAlignment = NSTextAlignmentCenter;
    self.psd.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.psd.layer.borderWidth = 0.5f;
    self.psd.layer.cornerRadius = 5;
    [self.view addSubview: self.psd];
    
    self.delBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.delBtn setFrame: CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 240, 100, 20)];
    self.delBtn.backgroundColor = [UIColor lightGrayColor];
    [self.delBtn setTitle: @"delegate传值" forState:UIControlStateNormal];
    self.delBtn.layer.cornerRadius = 5;
    self.delBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    [self.delBtn addTarget: self action: @selector(delBtnClicked:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: self.delBtn];
    
    
    // block传值
    self.block = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.block setFrame:(CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 280, 100, 20))];
    [self.block setTitle: @"block传值" forState:(UIControlStateNormal)];
    self.block.backgroundColor = [UIColor lightGrayColor];
    self.block.layer.cornerRadius = 5;
    [self.block addTarget: self action: @selector(blockBtnClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview: self.block];
    
    
    // 单例传值
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 320, 100, 20)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview: self.textField];
    
    self.single = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.single setFrame:(CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 350, 100, 20))];
    self.single.backgroundColor = [UIColor lightGrayColor];
    [self.single setTitle: @"单例传值" forState:(UIControlStateNormal)];
    self.single.layer.cornerRadius = 5;
    [self.single addTarget: self action: @selector(singleBtnClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview: self.single];
    
    // NSNotification传值
    self.notify = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.notify setFrame:(CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 380, 100, 20))];
    self.notify.backgroundColor = [UIColor lightGrayColor];
    [self.notify setTitle: @"Notification传值" forState:(UIControlStateNormal)];
    self.notify.layer.cornerRadius = 5;
    self.notify.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    [self.notify addTarget: self action:@selector(postNotifi) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview: self.notify];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(catchNotifi) name:@"myNotification" object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"myNotification" object:nil];
}

#pragma mark - NSNotification SEL

- (void)postNotifi
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"myNotification" object:self];
}

- (void)catchNotifi
{
    NotificationViewController *VC = [[NotificationViewController alloc]init];
    [self.navigationController pushViewController:VC animated: YES];
    return;
}

#pragma mark - Button Clicked

- (void) forwardBtnClicked:(id)sender
{
    ForwardViewController* VC = [[ForwardViewController alloc] init];
    VC.value = 1;
    [self.navigationController pushViewController: VC animated: YES];
    return;
}

- (void) methodBtnClicked:(id)sender
{
    MethodViewController* VC = [[MethodViewController alloc] init];
    [VC initWithValue: 2];
    [self.navigationController pushViewController: VC animated: YES];
    return;
    
}

- (void) delBtnClicked:(id)sender
{
    DelegateViewController *VC = [[DelegateViewController alloc]init];
    VC.delegate = self;
    [self.navigationController pushViewController:VC animated:YES];
    return;
}


- (void) passValue:(UserEntity *)value
{
    self.usr.text = value.usr;
    self.psd.text = value.psd;
}

- (void) blockBtnClicked:(id)sender
{
    // 声明一个block，需要传入一个颜色，让当前的view变色
    void(^changeColor)(UIColor *color) = ^void(UIColor *color) {
        self.block.backgroundColor = color;
    };
    // 声明一个block，需要传入一个textfield，改变当前按钮文字
    void(^changeValue)(UITextField *textField) = ^void(UITextField *textField) {
        [self.block setTitle: textField.text forState:(UIControlStateNormal)];
    };

    BlockViewController *VC = [[BlockViewController alloc]init];
    // block传值：将block给第二个页面
    VC.block = changeColor;
    VC.blockofValue = changeValue;
    VC.name = self.block.currentTitle;
    [self.navigationController pushViewController:VC animated:YES];
    return;
}

- (void) singleBtnClicked:(id)sender
{
    Singleton *oneS = [Singleton shareData];
    oneS.value = self.textField.text;
    SlngleViewController *VC = [[SlngleViewController alloc]init];
    [self.navigationController pushViewController: VC animated:YES];
    return;
}

#pragma mark - TextField Delegate

-(void)touchesBegan:(UITapGestureRecognizer *)tap
{
    [self.view endEditing:YES];
    return;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    return YES;
}

@end











