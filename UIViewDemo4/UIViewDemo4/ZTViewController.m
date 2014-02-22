//
//  ZTViewController.m
//  UIViewDemo4
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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)disabledClicked:(id)sender {
    self.bn1.enabled = !(self.bn1.enabled);
    self.bn2.enabled = !(self.bn2.enabled);
    if([[sender titleForState:UIControlStateNormal] isEqualToString:@"禁用"])
    {
        [sender setTitle:@"启用" forState:UIControlStateNormal];
    }else{
        [sender setTitle:@"禁用" forState:UIControlStateNormal];
    }
}
@end
