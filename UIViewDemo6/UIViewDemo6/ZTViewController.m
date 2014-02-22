//
//  ZTViewController.m
//  UIViewDemo6
//
//  Created by 翟涛 on 14-2-22.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import "ZTViewController.h"

@interface ZTViewController ()
@property (nonatomic, strong) UINavigationItem* navItem;
@end

@implementation ZTViewController
UIBarButtonItem* done;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // 将该控制器本身设置为textView控件的委托对象
	self.textView.delegate = self;
	// 创建、并添加导航条
	UINavigationBar* navBar = [[UINavigationBar alloc] initWithFrame:
                               CGRectMake(0, 20, 320, 44)];
	[self.view addSubview:navBar];
	// 创建导航项、并设置导航项的标题
	self.navItem = [[UINavigationItem alloc]
                    initWithTitle:@"导航条"];
	// 将导航栏添加到导航项中
	navBar.items = [NSArray arrayWithObject:self.navItem];
	// 创建一个UIBarButtonItem对象，并赋给done属性
	done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                         target:self action:@selector(finishEdit)];
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    self.navItem.rightBarButtonItem = done;
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    self.navItem.rightBarButtonItem = nil;
}
-(void)finishEdit
{
    [self.textView resignFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
