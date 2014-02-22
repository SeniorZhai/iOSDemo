//
//  ZTViewController.m
//  UIViewDemo1
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
    UILabel *myLabel1 = (UILabel *)[self.view viewWithTag:10];
    [myLabel1 setText:@"haha!"];
    [self.myLabel2 setText:@"hehe!"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickHandler:(id)sender {
    NSLog(@"------");
}
@end
