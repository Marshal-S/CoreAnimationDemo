//
//  UIViewOfCATransition.m
//  CAAnimation
//
//  Created by Marshal on 2017/9/15.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "UIViewOfCATransition.h"

@interface UIViewOfCATransition ()
{
    CALayer *layer;
}

@end

@implementation UIViewOfCATransition

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    [self createButtons];
    [self createLayer];
}

- (void)createButtons {
    NSArray *animationTitles = @[@"fade",@"moveIn",@"push",@"reval",@"rippleEffect"];
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
    layer.position = CGPointMake(self.bounds.size.width/5*3, self.bounds.size.height/2);
    layer.bounds = CGRectMake(0, 0, 200, 200);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:layer];
}

- (void)onClickToOperate:(UIButton *)sender {
    static NSInteger idx = 0;
    //这是一个帧动画，也就是说里面的动画是连续的，一个效果可以做几种样式
    NSArray<NSString *> *imageAry = @[@"yuan",@"suo",@"wancheng",@"cheliang",@"duigou"];
    CATransition *animation = [CATransition animation];
    switch (sender.tag) {
        case 10:{
            //values的优先级要小于path
            animation.type = kCATransitionFade;
        }break;
        case 11:{
            //values的优先级要小于path
            animation.type = kCATransitionMoveIn;
        }break;
        case 12:{
            //values的优先级要小于path
            animation.type = kCATransitionPush;
        }break;
        case 13:{
            //values的优先级要小于path
            animation.type = kCATransitionReveal;
        }break;
        case 14:{
            animation.type = @"rippleEffect";//水波纹效果//私有api
        }break;
        default:
            break;
    }
    if (!animation) return;
    animation.subtype = kCATransitionFromLeft;
    animation.duration = 1;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    layer.contents = (id)[UIImage imageNamed:imageAry[(++idx)%4]].CGImage;
    //    animation.duration = animation.settlingDuration;//使用自动计算出来的时间,这个相对更加准确
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [layer addAnimation:animation forKey:@"positionLayer"];
    
}

@end
