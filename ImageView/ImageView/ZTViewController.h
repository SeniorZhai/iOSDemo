//
//  ZTViewController.h
//  ImageView
//
//  Created by 翟涛 on 14-2-23.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *v1;

@property (weak, nonatomic) IBOutlet UIImageView *v2;
- (IBAction)plus:(id)sender;
- (IBAction)minus:(id)sender;
- (IBAction)next:(id)sender;

@end
