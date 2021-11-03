//
//  UIViewOfCABasicAnimation.m
//  CAAnimation
//
//  Created by Marshal on 2017/9/14.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "UIViewOfCABasicAnimation.h"

@interface UIViewOfCABasicAnimation ()<CAAnimationDelegate>

{
    CALayer *layer;
}

@end

@implementation UIViewOfCABasicAnimation

//简单的移动动画处理，主要是理解里面的属性
- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.position = CGPointMake(50, 50);
    layer.bounds = CGRectMake(0, 0, 100, 100);
    [self.layer addSublayer:layer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint position = [[touches anyObject] locationInView:self];
    //做一个简单动画
    //这个keypath其实是设置layer里面的属性，通过开始和结束等值，通过animation来创建补间动画，
    //其实更改的fromValue和toValue就是更改的keypath中的属性值
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.toValue = [NSValue valueWithCGPoint:position];//设置目标地点
    animation.delegate = self;
    animation.beginTime = CACurrentMediaTime()+0;//设置初试时间，这里延迟0秒
    animation.duration = 3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//设置动画节奏，也就是动画的方式，只是一些参考
//    animation.speed = 0.1;
//    animation.removedOnCompletion = NO;//动画结束后是否移除动画图层，要配合下面的属性使用可以保留动画图层,配合下面的效果不建议使用，建议使用结束后的处理
//    animation.fillMode = kCAFillModeForwards;//定义动画以外的处理方式,可以不还原动画效果
    
//    animation.autoreverses = YES;//默认为NO,完成动画后是否以动画的形式返回,配合repeat使用更恰当
//    animation.timeOffset = 0.1;//动画的偏移时间，不太建议使用
    [animation setValue:[NSValue valueWithCGPoint:position] forKey:@"positionToEnd"];//这个是通过kvc开保存结果的值，用来直接取出来通过事务来改变初始图层位置的的
    [layer addAnimation:animation forKey:NSStringFromSelector(_cmd)];
}

#pragma mark --停止动画后的回调方法
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    //开始一个事务
    [CATransaction begin];
    [CATransaction setDisableActions:YES];//在事务中关闭隐式效果
    layer.position = [[anim valueForKey:@"positionToEnd"] CGPointValue];
    [CATransaction commit];
}

@end
