//
//  SlngleViewController.m
//  Test
//
//  Created by MC on 15/11/20.
//  Copyright © 2015年 MC. All rights reserved.
//

#import "SlngleViewController.h"

@interface SlngleViewController ()

@end

@implementation SlngleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.singleTextField = [[UITextField alloc] initWithFrame:(CGRectMake(50, 100, 220, 30))];
    self.singleTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.singleTextField.enabled = NO;
    self.singleTextField.text = [Singleton shareData].value;
    [self.view addSubview: self.singleTextField];
    
}

@end
