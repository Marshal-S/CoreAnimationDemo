//
//  UIViewOfCAReplicatorLayer.m
//  LSLayer
//
//  Created by Marshal on 2017/9/13.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "UIViewOfCAReplicatorLayer.h"

@implementation UIViewOfCAReplicatorLayer

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    
    //电台波动
    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    layer.position = CGPointMake(self.bounds.size.width/2, 100);
    layer.bounds = CGRectMake(0, 0, self.bounds.size.width-120, 200);
    [self.layer addSublayer:layer];
    //设置子layer的基本样式
    CALayer *subLayer = [CALayer layer];
    subLayer.position = CGPointMake(2.5, 50);
    subLayer.bounds = CGRectMake(0, 0, 5, 40);
    subLayer.backgroundColor = [UIColor redColor].CGColor;
    [layer addSublayer:subLayer];
    //添加动画
    CABasicAnimation *baseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    baseAnimation.fromValue = @1;
    baseAnimation.toValue = @0.3;
    baseAnimation.duration = 0.1;
    baseAnimation.repeatCount = MAXFLOAT;
    baseAnimation.autoreverses = YES;
    [layer addAnimation:baseAnimation forKey:@"subLayerPosition"];
    //开始设置复制方式
    layer.instanceCount = 8;
    layer.instanceTransform = CATransform3DTranslate(CATransform3DIdentity, 40, 0, 0);
    layer.instanceDelay = 0.2;
    
    //旋转动画
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.position = CGPointMake(self.bounds.size.width/2, 250);
    replicatorLayer.bounds = CGRectMake(0, 0, 300, 300);
    [self.layer addSublayer:replicatorLayer];
    //注意这个点是相对于复制layer的基础点，可以通过控制它的位置来进一步控制动画的位置
    CALayer *rLayer = [CALayer layer];
    rLayer.position = CGPointMake(replicatorLayer.bounds.size.width/2+20, 20);
    rLayer.bounds = CGRectMake(0, 0, 40, 40);
    rLayer.cornerRadius = 20;
    rLayer.backgroundColor = [UIColor blueColor].CGColor;
    [replicatorLayer addSublayer:rLayer];
    rLayer.transform = CATransform3DScale(CATransform3DIdentity, 0, 0, 0);
    //scale变换动画
    CABasicAnimation *baseA = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    baseA.fromValue = @1;
    baseA.toValue = @0.1;
    baseA.duration = 0.5;
    baseA.autoreverses  = YES;
    baseA.repeatCount = MAXFLOAT;
    [rLayer addAnimation:baseA forKey:@"rLayerScale"];
    //设置复制方式
    replicatorLayer.instanceCount = 15;
    replicatorLayer.instanceDelay = 0.05;
    replicatorLayer.instanceTransform = CATransform3DRotate(CATransform3DIdentity, M_PI*2/15, 0, 0, 1);//注意旋转的点是replicatorLayer的position
    
    //设置轨迹动画
    CAReplicatorLayer *bLayer = [CAReplicatorLayer layer];
    bLayer.position = CGPointMake(self.bounds.size.width/2, 550);
    bLayer.bounds = CGRectMake(0, 0, self.bounds.size.width, 300);
    [self.layer addSublayer:bLayer];
    CALayer *bSubLayer = [CALayer layer];
    bSubLayer.cornerRadius = 15;
    bSubLayer.backgroundColor = [UIColor yellowColor].CGColor;
    bSubLayer.position = CGPointMake(15, 150);
    bSubLayer.bounds = CGRectMake(0, 0, 30, 30);
    [bLayer addSublayer:bSubLayer];
    //获取路径,注意了，路径也是相遇于他的layer坐标系的
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(15, 150)];
    [path addCurveToPoint:CGPointMake(self.bounds.size.width-15, 150) controlPoint1:CGPointMake(self.bounds.size.width/2, 15) controlPoint2:CGPointMake(self.bounds.size.width/2, 285)];
    [path addCurveToPoint:CGPointMake(15, 150) controlPoint1:CGPointMake(self.bounds.size.width/2, 15) controlPoint2:CGPointMake(self.bounds.size.width/2, 285)];
    CAKeyframeAnimation *baseB = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    baseB.path = path.CGPath;
    baseB.duration = 3;
    baseB.repeatCount = NSIntegerMax;
    [bSubLayer addAnimation:baseB forKey:@"bSubLayerPostion"];
    bLayer.instanceCount = 15;
    bLayer.instanceDelay = 0.2;
    
    
}













@end
