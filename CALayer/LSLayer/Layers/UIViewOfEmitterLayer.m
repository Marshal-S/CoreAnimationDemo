//
//  UIViewOfEmitterLayer.m
//  LSLayer
//
//  Created by Marshal on 2017/9/11.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "UIViewOfEmitterLayer.h"

@implementation UIViewOfEmitterLayer

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    //发射layer
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.emitterPosition = CGPointMake(self.bounds.size.width/2, -20);//初始的中心点位置，以此点为中心点向别处发散
    emitterLayer.emitterSize = self.bounds.size;
    emitterLayer.birthRate = 1.0;//发射速度
    //发射粒子形状
    emitterLayer.emitterShape = kCAEmitterLayerLine;
    //kCAEmitterLayerPoints、kCAEmitterLayerOutline、kCAEmitterLayerSurface、kCAEmitterLayerVolume
    //点模式，轮廓模式，表面模式，3d模式
    emitterLayer.emitterMode = kCAEmitterLayerSurface;//发射模式
//    emitterLayer.renderMode = kCAEmitterLayerUnordered;//渲染模式
    emitterLayer.lifetime = 1.0;//粒子生存周期
    
//    CAEmitterCell类代表从CAEmitterLayer射出的粒子；emitter cell定义了粒子发射的方向。
//    alphaRange:  一个粒子的颜色alpha能改变的范围；
//    alphaSpeed:粒子透明度在生命周期内的改变速度；
//    birthrate：粒子参数的速度乘数因子；每秒发射的粒子数量
//    blueRange：一个粒子的颜色blue 能改变的范围；
//    blueSpeed: 粒子blue在生命周期内的改变速度；
//    color:粒子的颜色
//    contents：是个CGImageRef的对象,既粒子要展现的图片；
//    contentsRect：应该画在contents里的子rectangle：
//    emissionLatitude：发射的z轴方向的角度
//    emissionLongitude:x-y平面的发射方向
//    emissionRange；周围发射角度
//    emitterCells：粒子发射的粒子
//    enabled：粒子是否被渲染
//    greenrange: 一个粒子的颜色green 能改变的范围；
//    greenSpeed: 粒子green在生命周期内的改变速度；
//    lifetime：生命周期
//    lifetimeRange：生命周期范围      lifetime= lifetime(+/-) lifetimeRange
//    magnificationFilter：不是很清楚好像增加自己的大小
//    minificatonFilter：减小自己的大小
//    minificationFilterBias：减小大小的因子
//    name：粒子的名字
//    redRange：一个粒子的颜色red 能改变的范围；
//    redSpeed; 粒子red在生命周期内的改变速度；
//    scale：缩放比例：
//    scaleRange：缩放比例范围；
//    scaleSpeed：缩放比例速度：
//    spin：子旋转角度
//    spinrange：子旋转角度范围
//    velocity：速度
//    velocityRange：速度范围
//    xAcceleration:粒子x方向的加速度分量
//    yAcceleration:粒子y方向的加速度分量
//    zAcceleration:粒子z方向的加速度分量
//    emitterCells:粒子发射的粒子
    CAEmitterCell *rain = [CAEmitterCell emitterCell];
    rain.birthRate = 5;//每秒发射粒子数
    rain.velocity = 10;//初始速度
    rain.velocityRange = 10;//速波动范围
    rain.yAcceleration = 100;//y轴方向加速度
//    rain.xAcceleration = 30;//x轴方向加速度
    rain.color = [UIColor whiteColor].CGColor;//颜色，可被内容忽略
    rain.contents = (__bridge id _Nullable)([UIImage imageNamed:@"chezi"].CGImage);//内容
//    rain.spin = 0.2*M_PI;//旋转速度
//    rain.spinRange = 0.5*M_PI;//旋转速度波动范围
    rain.lifetime = 5;//粒子存在周期,不设置默认为0,也就是不显示，单位秒
    rain.scale = 0.5;//内容缩放比例
    rain.scaleRange = 0.3;//内容缩放比例波动范围
    
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    snowflake.birthRate = 5;
    snowflake.velocity = 10;
    snowflake.lifetime = 5;
    snowflake.velocityRange = 5;
    snowflake.yAcceleration = 60;
//    snowflake.xAcceleration = 30;
    snowflake.contents = (__bridge id _Nullable)([UIImage imageNamed:@"weixin"].CGImage);
    snowflake.color = [UIColor whiteColor].CGColor;
    snowflake.scale = 0.5;
    snowflake.scaleRange = 0.4;
    
    emitterLayer.emitterCells = @[rain,snowflake];//添加的内容
    
    [self.layer addSublayer:emitterLayer];
}


@end
