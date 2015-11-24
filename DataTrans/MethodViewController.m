//
//  MethodViewController.m
//  DataTrans
//
//  Created by MC on 15/11/23.
//  Copyright © 2015年 MC. All rights reserved.
//

#import "MethodViewController.h"

@interface MethodViewController ()

@end

@implementation MethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 100, 100, 20)];
    label.text = [NSString stringWithFormat:@"%d", _value];
    [self.view addSubview: label];

}


- (void)initWithValue:(NSInteger)value
{
    _value = value;
    return;
}

@end
