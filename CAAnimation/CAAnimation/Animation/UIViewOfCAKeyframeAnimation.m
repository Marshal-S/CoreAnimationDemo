
//
//  UIViewOfCAKeyframeAnimation.m
//  CAAnimation
//
//  Created by Marshal on 2017/9/15.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "UIViewOfCAKeyframeAnimation.h"

@interface UIViewOfCAKeyframeAnimation ()
{
    CALayer *layer;
}

@end

@implementation UIViewOfCAKeyframeAnimation

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    [self createButtons];
    [self createLayer];
}

- (void)createButtons {
    NSArray *animationTitles = @[@"我手一抖",@"看我好玩么"];
    for (NSInteger idx = 0; idx < animationTitles.count; idx++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = 10+idx;
        btn.backgroundColor = [UIColor blackColor];
        btn.frame = CGRectMake(10, idx*60 + 40, 120, 30);
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setTitle:animationTitles[idx] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(onClickToOperate:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

- (void)createLayer {
    layer = [CALayer layer];
    layer.position = CGPointMake(self.bounds.size.width/4*3, self.bounds.size.height/2);
    layer.bounds = CGRectMake(0, 0, 80, 80);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:layer];
}

- (void)onClickToOperate:(UIButton *)sender {
    //这是一个帧动画，也就是说里面的动画是连续的，一个效果可以做几种样式
    CAKeyframeAnimation *animation;
    switch (sender.tag) {
        case 10:{
            //values的优先级要小于path
            animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
            animation.values = @[@(-M_PI_4/10), @(M_PI_4/10)];
            animation.duration = 0.1;
        }break;
        case 11:{
            animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(40, 40, self.bounds.size.width-80, self.bounds.size.height-80)];
            animation.path = path.CGPath;
            animation.duration = 3;
//            animation.autoreverses = YES;
        }break;
        default:
            break;
    }
    if (!animation) return;
    animation.repeatCount = 10;
    //    animation.duration = animation.settlingDuration;//使用自动计算出来的时间,这个相对更加准确
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [layer addAnimation:animation forKey:@"positionLayer"];
    
}
@end
