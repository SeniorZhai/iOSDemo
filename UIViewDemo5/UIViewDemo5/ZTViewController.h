//
//  ZTViewController.h
//  UIViewDemo5
//
//  Created by 翟涛 on 14-2-22.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTViewController : UIViewController
- (IBAction)finishEdit:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *passField;
- (IBAction)backTap:(id)sender;

@end
