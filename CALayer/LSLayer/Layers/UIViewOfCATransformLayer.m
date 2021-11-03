//
//  UIViewOfCATransformLayer.m
//  LSLayer
//
//  Created by Marshal on 2017/9/12.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "UIViewOfCATransformLayer.h"

@interface UIViewOfCATransformLayer ()
{
    CGPoint startPoint;
    CATransformLayer *layer;
}

@end

@implementation UIViewOfCATransformLayer

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    //这个layer相当于一个立方体容器，在里面添加layer的话可以拥有一些不错的3d效果,配合CATransform3D使用更佳
    //我们可以根据这个类创建各种各样的效果
    layer = [CATransformLayer layer];
    //创建子layer
    //上
    CATransform3D transform = CATransform3DMakeTranslation(0, -50, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [layer addSublayer:[self getSublayerWithTransform:transform color:[UIColor blueColor]]];
    //下
    transform = CATransform3DMakeTranslation(0, 50, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [layer addSublayer:[self getSublayerWithTransform:transform color:[UIColor grayColor]]];
    //左
    transform = CATransform3DMakeTranslation(-50, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [layer addSublayer:[self getSublayerWithTransform:transform color:[UIColor yellowColor]]];
    //右
    transform = CATransform3DMakeTranslation(50, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [layer addSublayer:[self getSublayerWithTransform:transform color:[UIColor brownColor]]];
    //前
    transform = CATransform3DMakeTranslation(0, 0, 50);
    [layer addSublayer:[self getSublayerWithTransform:transform color:[UIColor redColor]]];
    //后
    transform = CATransform3DMakeTranslation(0, 0, -50);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [layer addSublayer:[self getSublayerWithTransform:transform color:[UIColor purpleColor]]];
    
    layer.position = CGPointMake(self.center.x, self.center.y);
//    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.transform = CATransform3DIdentity;
    [self.layer addSublayer:layer];
}

#pragma mark --获取某一面的layer
- (CALayer *)getSublayerWithTransform:(CATransform3D)transform color:(UIColor *)color {
    CALayer *sublayer = [CALayer layer];
    sublayer.frame = CGRectMake(-50, -50, 100, 100); //一定要注意，position不要乱动不然这个旋转中心点也会跟着变动
//    sublayer.position = CGPointMake(-50, -50);
//    sublayer.bounds = CGRectMake(0, 0, 100, 100);
    sublayer.transform = transform;
    sublayer.backgroundColor = color.CGColor;
    return sublayer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    startPoint = [[touches anyObject] locationInView:self];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint currentPoint = [[touches anyObject] locationInView:self];
    CGFloat moveX = currentPoint.x - startPoint.x;
    CGFloat moveY = currentPoint.y - startPoint.y;
    CGFloat baseAngle = M_PI/200;
    CATransform3D transform = CATransform3DRotate(CATransform3DIdentity, baseAngle*moveX, 0, 1, 0);
    transform = CATransform3DRotate(transform, -baseAngle*moveY, 1, 0, 0);
    layer.transform = transform;
}






@end
