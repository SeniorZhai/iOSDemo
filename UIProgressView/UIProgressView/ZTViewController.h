//
//  ZTViewController.h
//  UIProgressView
//
//  Created by 翟涛 on 14-2-23.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIProgressView *prog1;
@property (weak, nonatomic) IBOutlet UIProgressView *prog2;
@property (weak, nonatomic) IBOutlet UIProgressView *prog3;
@property (strong, nonatomic) IBOutletCollection(UIActivityIndicatorView) NSArray *indicators;

- (IBAction)clicked:(id)sender;
@end
