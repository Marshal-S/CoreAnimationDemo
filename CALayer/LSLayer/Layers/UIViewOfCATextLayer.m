//
//  UIViewOfCATextLayer.m
//  LSLayer
//
//  Created by Marshal on 2017/9/13.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "UIViewOfCATextLayer.h"

@implementation UIViewOfCATextLayer

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    
    CATextLayer *layer = [CATextLayer layer];
    layer.contentsScale = [UIScreen mainScreen].scale;
    layer.font = (__bridge CFTypeRef _Nullable)([UIFont systemFontOfSize:30]);
    layer.fontSize = 30;
    layer.string = @"我是CATextLayer绘制出来的";
    layer.position = self.center;
    layer.bounds = CGRectMake(0, 0, self.bounds.size.width, 30);
    layer.foregroundColor = [UIColor redColor].CGColor;
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    layer.alignmentMode = kCAAlignmentCenter;
    layer.truncationMode = kCATruncationEnd;
    [self.layer addSublayer:layer];
}

@end
