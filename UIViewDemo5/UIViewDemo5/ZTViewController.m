//
//  ZTViewController.m
//  UIViewDemo5
//
//  Created by 翟涛 on 14-2-22.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import "ZTViewController.h"

@interface ZTViewController ()

@end

@implementation ZTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)finishEdit:(id)sender {
    // 放弃作为第一响应者
    [sender resignFirstResponder];
}
// 将背景的UIView改为UIControl
- (IBAction)backTap:(id)sender {
    [self.nameField resignFirstResponder];
    [self.passField resignFirstResponder];
}
@end
