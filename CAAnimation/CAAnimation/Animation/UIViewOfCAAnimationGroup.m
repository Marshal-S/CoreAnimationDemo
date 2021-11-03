//
//  UIViewOfCAAnimationGroup.m
//  CAAnimation
//
//  Created by Marshal on 2017/9/15.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "UIViewOfCAAnimationGroup.h"

@implementation UIViewOfCAAnimationGroup

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    CALayer *layer = [CALayer layer];
    layer.position = CGPointMake(self.bounds.size.width/4*3, self.bounds.size.height/2);
    layer.bounds = CGRectMake(0, 0, 80, 80);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:layer];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    animation.values = @[@(-M_PI_4/10), @(M_PI_4/10)];
    animation.duration = 0.1;
    animation.repeatCount = 10;
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation1.toValue = @(40);
    animation1.duration = 1;
    animation1.repeatCount = 1;
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation2.toValue = @(0.1);
    animation2.duration = 1;
    animation2.repeatCount = 1;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];//动画组最好是做一些不冲突可以叠加的效果
    group.duration = 3;
    group.autoreverses = NO;
    group.animations = @[animation,animation1,animation2];
    group.repeatCount = NSIntegerMax;
    [layer addAnimation:group forKey:@"groupAnimation"];
    
}

@end
