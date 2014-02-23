//
//  ZTViewController.m
//  UIProgressView
//
//  Created by 翟涛 on 14-2-23.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import "ZTViewController.h"

@interface ZTViewController ()

@end
NSTimer* timer;
CGFloat progVal;
@implementation ZTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    UIImage * trackImage = [[UIImage imageNamed:@"no.gif"]resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile];
    UIImage * progressImage = [[UIImage imageNamed:@"ok.gif"]resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile];
    self.prog3.trackImage = trackImage;
    self.prog3.progressImage = progressImage;
}

- (void)changeProgress
{
    progVal += 0.01;
    if(progVal > 1.0)
    {
        [timer invalidate];
        for (int i = 0; i < self.indicators.count; i++) {
            [[self.indicators objectAtIndex:i] stopAnimating];
        }
    }else{
        [self.prog1 setProgress:progVal];
        [self.prog2 setProgress:progVal];
        [self.prog3 setProgress:progVal];
    }
}
- (IBAction)clicked:(id)sender {
    progVal = 0;
    for (int i = 0; i < self.indicators.count; i++) {
        [[self.indicators objectAtIndex:i] startAnimating];
    }
    timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(changeProgress) userInfo:nil repeats:YES];
}
@end
