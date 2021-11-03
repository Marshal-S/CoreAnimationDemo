
//
//  UIViewOfCASpringAniamtion.m
//  CAAnimation
//
//  Created by Marshal on 2017/9/14.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "UIViewOfCASpringAniamtion.h"

@interface UIViewOfCASpringAniamtion ()

{
    CALayer *layer;
}

@end

@implementation UIViewOfCASpringAniamtion

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    [self createButtons];
    [self createLayer];
}

- (void)createButtons {
    NSArray *animationTitles = @[@"移动",@"缩放",@"透明度",@"旋转",@"圆角变换"];
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
    CASpringAnimation *animation;
    switch (sender.tag) {
        case 10:{
            animation = [CASpringAnimation animationWithKeyPath:@"position"];
            animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.bounds.size.width/4*3, 100)];
            animation.duration = 3;
        }break;
        case 11:{
            animation = [CASpringAnimation animationWithKeyPath:@"transform.scale"];
            animation.toValue = @(0.1);
            animation.duration = 1;
        }break;
        case 12:{
            animation = [CASpringAnimation animationWithKeyPath:@"opacity"];
            animation.toValue = @(0.1);
            animation.duration = 2;
        }break;
        case 13:{
            animation = [CASpringAnimation animationWithKeyPath:@"transform"];
            animation.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(CATransform3DIdentity, M_PI_4*3, 1, 1, 0)];//绕着y=x;旋转
            animation.duration = 2;
        }break;
        case 14:{
            animation = [CASpringAnimation animationWithKeyPath:@"cornerRadius"];
            animation.toValue = @(40);
            animation.duration = 3;
        }break;
        default:
            break;
    }
    if (!animation) return;
    animation.damping = 2;
    animation.mass = 1;
    animation.initialVelocity = 10;
//    animation.duration = animation.settlingDuration;//使用自动计算出来的时间,这个相对更加准确
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.autoreverses = YES;//自动还原
    [layer addAnimation:animation forKey:@"positionLayer"];
    
}


@end
