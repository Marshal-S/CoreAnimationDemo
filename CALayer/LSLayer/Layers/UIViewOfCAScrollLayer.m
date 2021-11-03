//
//  UIViewOfCAScrollLayer.m
//  LSLayer
//
//  Created by Marshal on 2017/9/13.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "UIViewOfCAScrollLayer.h"

@interface UIViewOfCAScrollLayer ()
{
    CAScrollLayer *layer;
}


@end

@implementation UIViewOfCAScrollLayer

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    //发现很难用没什么东西，不建议使用,应该是配合view
    layer = [CAScrollLayer layer];
    UIImage *image = [UIImage imageNamed:@"timg4.jpg"];
    layer.contents = (__bridge id _Nullable)(image.CGImage);
    layer.scrollMode = kCAScrollBoth;
//    layer.position = self.center;
    layer.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    self.contentSize = layer.bounds.size;
    [self.layer addSublayer:layer];
    
}


@end
