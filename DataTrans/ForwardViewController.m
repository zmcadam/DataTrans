//
//  ForwardViewController.m
//  DataTrans
//
//  Created by MC on 15/11/23.
//  Copyright © 2015年 MC. All rights reserved.
//

#import "ForwardViewController.h"

@interface ForwardViewController ()

@end

@implementation ForwardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 100, 100, 20)];
    label.text = [NSString stringWithFormat:@"%d", _value];
    [self.view addSubview: label];
    
    
}

@end
