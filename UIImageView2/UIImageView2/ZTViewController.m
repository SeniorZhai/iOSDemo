//
//  ZTViewController.m
//  UIImageView2
//
//  Created by 翟涛 on 14-2-23.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import "ZTViewController.h"

@interface ZTViewController ()

@end

@implementation ZTViewController
NSArray *images;

- (void)viewDidLoad
{
    [super viewDidLoad];
    images = [NSArray arrayWithObjects:[UIImage imageNamed:@"1.jpeg"],[UIImage imageNamed:@"2.jpeg"],[UIImage imageNamed:@"3.jpeg"], nil];
    self.v1.animationImages = images;
    self.v1.animationDuration = 12;
    self.v1.animationRepeatCount = 9999;
    [self.v1 startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
