//
//  UIViewOfCAShaperLayer.m
//  LSLayer
//
//  Created by Marshal on 2017/9/11.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "UIViewOfCAShaperLayer.h"

@interface UIViewOfCAShaperLayer ()
{
    dispatch_source_t timer;
}


@end

@implementation UIViewOfCAShaperLayer

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    //CAShapeLayer
    //fileColor和fillRule
    //fileColor表示layer的path的填充颜色，fillRule属性用于指定使用哪一种算法去判断画布上的某区域是否属于“该图形”内部
    //fileRule一共有两个美枚举类型，分别是kCAFillRuleNonZero和kCAFillRUleEvenOdd
    //kCAFillRuleNonZero是以穿过的射线来判断，从区域一个点，往外任意方向引出一条射线，如果被顺时针画出的线穿过则+1，被逆时针穿过的线-1结果等于0表示在外面，大于零表示在里面
    //kCAFillRUleEvenOdd,和上面的规则差不多，只是以奇偶数来判断内外，如果得出的值是技术则认为在内部，否则在外部
    //path 贝塞尔曲线的路径
    //lineWidth 边缘划线的宽度，这个设置了之后，贝塞尔曲线的就不管用了
    //stokeColor和fillColor分别是划线和填充的意思，即线条颜色和内容颜色
    //strokeStart表示的是设置初始值
    //strokeEnd表示的是设置划线百分比的最终值
    //lineJoin表示的是连接点的样式,分别是kCALineJoinMiter、kCALineJoinRound和kCALineJoinBevel，分别是尖角，圆角，切角的样式
    //lineCap 端点的样式kCALineCapButt,kCALineCapRound,kCALineCapSquare
    //miterLimit表示的是最大斜接长度,但只又lineJoin属性设置成了尖角(kCALineJoinMiter)的时候才会有效，角度如果过小的话尖角过长的部分会被削掉，会削城切角的形式即（kCALineJoinBevel)
    //lineDashPattern 虚线设置，为一个数组，数组中奇数位实线长度，偶数位带遍空白长度（注意：这里的奇数，偶数以数组的第一个元素索引为1计算）
    //lineDashPhase时 虚线开始的位置，可以使用此属性做一个滚动的虚线框
    
    //下面简单测试一下效果
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 200, 100) cornerRadius:15];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = 3;
    layer.strokeColor = [UIColor whiteColor].CGColor;
    layer.fillColor = [UIColor grayColor].CGColor;
//    layer.strokeStart = 0;
//    layer.strokeEnd = 1;
    layer.lineDashPattern = @[@6,@6];
    layer.path = path.CGPath;
    [self.layer addSublayer:layer];
    
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            CGFloat add = 6;
            layer.lineDashPhase += add;
        });
    });
    dispatch_resume(timer);
}


@end
