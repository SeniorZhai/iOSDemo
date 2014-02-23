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
    UIToolbar * topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    UIBarButtonItem* myBn = [[UIBarButtonItem alloc] initWithTitle:@"无工作" style:UIBarButtonItemStyleBordered target:self action:nil];
    UIBarButtonItem* spaceBn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem* doneBn = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:nil];
    NSArray * array = [NSArray arrayWithObjects:myBn,spaceBn,doneBn, nil];
    [topView setItems:array];
    // 为textView关联的虚拟键盘设置附件。
    [self.textView setInputAccessoryView:topView];
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
}

@end
