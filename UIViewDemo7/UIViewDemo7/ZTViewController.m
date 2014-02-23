//
//  ZTViewController.m
//  UIViewDemo7
//
//  Created by 翟涛 on 14-2-23.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import "ZTViewController.h"

@interface ZTViewController ()

@end

@implementation ZTViewController
char flag = 0;
- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clicked1:(id)sender {
    flag = 1;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"内容" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"按钮1",@"按钮2",@"按钮3",nil];
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(flag == 1){
        NSString* msg = [NSString stringWithFormat:@"你点击了第%d个按钮",buttonIndex];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        flag = 0;
        [alert show];
    }
    if(flag ==2){
        if (buttonIndex == 1) {
            UITextField* nameField = [alertView textFieldAtIndex:0];
            UITextField* passwordField = [alertView textFieldAtIndex:1];
            NSString* msg = [NSString stringWithFormat:@"您输入的用户名为%@，密码为%@",nameField.text,passwordField.text];
            flag = 0;
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];

        }
    }
}
- (IBAction)clicked2:(id)sender {
    flag = 2;
    UIAlertView *alert = [[UIAlertView alloc]
initWithTitle:@"登入" message:@"请输入用户名和密码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alert textFieldAtIndex:1].keyboardAppearance = UIKeyboardTypeNumberPad;
    [alert show];
}
- (IBAction)clicked3:(id)sender{
    UIActionSheet* sheet = [[UIActionSheet alloc]initWithTitle:@"标题" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:@"按钮1",@"按钮2",nil];
    sheet.actionSheetStyle = UIActionSheetStyleAutomatic;
    [sheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString* msg = [NSString stringWithFormat:@"你点击了第%d个按钮",buttonIndex];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    flag = 0;
    [alert show];
}
- (void)willPresentAlertView:(UIAlertView *)alertView
{
    for(UIView * view in alertView.subviews)
    {
        if([view isKindOfClass:[UILabel class]])
        {
            UILabel* label = (UILabel *)view;
            label.textAlignment = UITextAlignmentLeft;
        }
    }
}
@end
