//
//  ZTViewController.m
//  ImageView
//
//  Created by 翟涛 on 14-2-23.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import "ZTViewController.h"

@interface ZTViewController ()

@end

@implementation ZTViewController
NSArray* images;
int curImage;
CGFloat alpha;
- (void)viewDidLoad
{
    [super viewDidLoad];
	curImage = 1;
    alpha = 1.0;
    images = [NSArray arrayWithObjects:@"1.jpeg",@"2.png",@"3.png",nil];
    self.v1.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clicked:)];
    [self.v1 addGestureRecognizer:singleTap];
    self.v1.image = [UIImage imageNamed:@"1.jpeg"];
}
- (void)clicked:(UIGestureRecognizer *)gesturRecongnizer;
{
    NSLog(@"clicked");
    UIImage* srcImage = self.v1.image;
    CGPoint pt = [gesturRecongnizer locationInView:self.v1];
    CGImageRef sourceImageRef = [srcImage CGImage];
    CGFloat scale = srcImage.size.width / 320;
    CGFloat x = pt.x * scale;
    CGFloat y = pt.y * scale;
    if(x+120 > srcImage.size.width)
    {
        x = srcImage.size.width - 140;
    }
    if(y+120 >srcImage.size.height)
    {
        y = srcImage.size.height -140;
    }
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, CGRectMake(x,y, 140, 140));
    self.v2.image = [UIImage imageWithCGImage:newImageRef];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)plus:(id)sender {
    alpha += 0.1;
    if(alpha >= 1.0)
    {
        alpha = 1.0;
    }
    self.v1.alpha = alpha;
}

- (IBAction)minus:(id)sender {
    alpha -= 0.1;
    if(alpha <= 0.0)
    {
        alpha = 0.0;
    }
    self.v1.alpha = alpha;
}

- (IBAction)next:(id)sender {
    self.v1.image = [UIImage imageNamed:[images objectAtIndex:(++curImage % images.count)]];
}

@end
