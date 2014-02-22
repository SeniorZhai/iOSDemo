//
//  ZTViewController.m
//  UIViewDemo3
//
//  Created by 翟涛 on 14-2-22.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import "ZTViewController.h"

@interface ZTViewController ()

@end
int nextY = 80;
@implementation ZTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    self.labels = [NSMutableArray array];
    UIButton *addBn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addBn.frame = CGRectMake(30, 30, 60, 40);
    [addBn setTitle:@"添加" forState:UIControlStateNormal];
    [addBn addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *removeBn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    removeBn.frame = CGRectMake(230, 30, 60, 40);
    [removeBn setTitle:@"删除" forState:UIControlStateNormal];
    [removeBn addTarget:self action:@selector(remove:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBn];
    [self.view addSubview:removeBn];
}

-(void)add:(id)sender{
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(80, nextY, 160, 30)];
    label.text = @"Label Item!!!!";
    [self.labels addObject:label];
    [self.view addSubview:label];
    nextY += 50;
}
-(void)remove:(id)sender{
    if([self.labels count]>0)
    {
        [[self.labels lastObject] removeFromSuperview];
        [self.labels removeLastObject];
        nextY -= 50;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
