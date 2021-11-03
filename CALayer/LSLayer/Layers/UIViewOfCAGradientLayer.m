//
//  UIViewOfCAGradientLayer.m
//  LSLayer
//
//  Created by Marshal on 2017/9/11.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "UIViewOfCAGradientLayer.h"

@interface UIViewOfCAGradientLayer ()

{
    dispatch_source_t timer;
}

@end

@implementation UIViewOfCAGradientLayer

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    //CAGradientLayer
    //colors 在Layer中现实的几种颜色并完成完美过渡，和CAShapeLayer的path一样，colors是CAGradientLayer特殊属性的起点，也就是x 显示的要素。
    //locations 颜色区间分布比例，默认为线性均匀分布。取值范围为0～1递增，一般来说其中的元素个数应与colors中的元素个数相同，不同时系统会自行处理分布规则。设置 gradientLayer.locations = @[@(0.3),@(0.7)],也就是说第一个颜色和第二个颜色占用空间比分别为0.3，过度区间为0.7-0.3=0.4
    //注意了这个locations点的比例是按照startPoint和endPoint得区间来控制比例的
    //startPoint endPoint startPoint决定了变色范围的起始点，endPoint决定了变色范围的结束点，两者的连线决定变色的趋势：,也就是所从第一个点的位置开始往另外一个方向扩散（变换）颜色
    
    NSArray *colorsAry = @[(id)[UIColor redColor].CGColor, (id)[UIColor purpleColor].CGColor, (id)[UIColor greenColor].CGColor];
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.position = CGPointMake(200, 240);
    layer.bounds = CGRectMake(0, 0, 240, 240);
    //    layer.locations = @[];
    layer.colors = colorsAry;
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 1);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 200, 200)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor whiteColor].CGColor;//必须要给一个颜色，不然不显示
    shapeLayer.path = path.CGPath;
    shapeLayer.lineWidth = 10;
    shapeLayer.strokeStart = 0;
    shapeLayer.strokeEnd = 0;
    layer.mask = shapeLayer;
    
    [self.layer addSublayer:layer];
    
//    __block BOOL desction = YES;//正向
    
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (shapeLayer.strokeEnd <= 1) {
                shapeLayer.strokeEnd += 0.04;
            }else if (shapeLayer.strokeStart <= 1) {
                shapeLayer.strokeStart += 0.04;
            }else {
                [CATransaction begin];
                [CATransaction setDisableActions:YES];
                shapeLayer.strokeStart = 0;
                shapeLayer.strokeEnd = 0;
                [CATransaction commit];
            }
    
            //连续往返动画
//            if (desction) {
//                if (shapeLayer.strokeEnd >= 1) {
//                    if (shapeLayer.strokeStart >= 1) {
//                        desction = NO;
//                    }else {
//                        shapeLayer.strokeStart += 0.02;
//                    }
//                }else {
//                    shapeLayer.strokeEnd += 0.02;
//                }
//            }else {
//                if (shapeLayer.strokeEnd > 0) {
//                    if (shapeLayer.strokeStart > 0) {
//                        shapeLayer.strokeStart -= 0.02;
//                    }else {
//                        shapeLayer.strokeEnd -= 0.02;
//                    }
//                }else {
//                    desction = YES;
//                }
//            }
        });
    });
    dispatch_resume(timer);
    
}



@end
