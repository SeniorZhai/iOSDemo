//
//  ZTCustomView.m
//  UIViewDemo3
//
//  Created by 翟涛 on 14-2-22.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import "ZTCustomView.h"

@implementation ZTCustomView

int curX;
int curY;

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint lastTouch = [touch locationInView:self];
    curX = lastTouch.x;
    curY = lastTouch.y;
    // 通知该组件重绘
    [self setNeedsDisplay];
}
-(void)drawRect:(CGRect)rect
{
    // 获得绘图的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 设置填充颜色
    CGContextSetFillColorWithColor(ctx, [[UIColor redColor]CGColor]);
    // 以触碰点为圆心，绘制一个圆形
    CGContextFillEllipseInRect(ctx, CGRectMake(curX - 10, curY - 10, 20, 20));
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
