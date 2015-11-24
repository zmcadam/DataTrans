//
//  MainViewController.h
//  DataTrans
//
//  Created by MC on 15/11/20.
//  Copyright © 2015年 MC. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "PassValueDelegate.h"

@class UserEntity;

@interface MainViewController : UIViewController<PassValueDelegate>


@property (weak, nonatomic) UIButton* forward;
@property (weak, nonatomic) UIButton* method;

@property (retain, nonatomic) UILabel* usr;
@property (retain, nonatomic) UILabel* psd;
@property (weak, nonatomic) UIButton* delBtn;

@property (retain, nonatomic) IBOutlet UITextField* textField;
@property (weak, nonatomic) UIButton* block;

@property (weak, nonatomic) UIButton* single;

@property (weak, nonatomic) UIButton* notify;

@end

