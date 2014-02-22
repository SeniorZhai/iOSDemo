//
//  ZTViewController.h
//  UIViewDemo4
//
//  Created by 翟涛 on 14-2-22.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *bn1;
@property (weak, nonatomic) IBOutlet UIButton *bn2;
- (IBAction)disabledClicked:(id)sender;

@end
