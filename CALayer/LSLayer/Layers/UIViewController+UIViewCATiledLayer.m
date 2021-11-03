//
//  UIViewController+UIViewCATiledLayer.m
//  LSLayer
//
//  Created by Marshal on 2017/9/14.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "UIViewController+UIViewCATiledLayer.h"

@implementation UIViewController (UIViewCATiledLayer)

//由于该方法不在vc中可能获取不到上下文的问题可能会崩溃，所以要特殊处理
#pragma mark -CATiedLayer
- (void)initLay {
    CATiledLayer *layer = [CATiledLayer layer];
    layer.frame = CGRectMake(0, 0, self.view.bounds.size.width*6, self.view.bounds.size.height*6);
    layer.tileSize = self.view.bounds.size;
    layer.delegate = self;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.tag = 1001;
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.bounces = NO;
    [self.view insertSubview:scrollView belowSubview:[self.view viewWithTag:100]];
    scrollView.contentSize = layer.bounds.size;
    [scrollView.layer addSublayer:layer];
}

#pragma mark --layerDelegate  optional
- (void)drawLayer:(CATiledLayer *)layer inContext:(CGContextRef)ctx {
    CGRect bounds = CGContextGetClipBoundingBox(ctx);
    NSInteger x = floor(bounds.origin.x / layer.tileSize.width);
    NSInteger y = floor(bounds.origin.y / layer.tileSize.height);
    //
    NSString *imageName = [NSString stringWithFormat: @"%@_%@", @(x), @(y)];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
    UIImage *tileImage = [UIImage imageWithContentsOfFile:imagePath];
    //
    UIGraphicsPushContext(ctx);
    [tileImage drawInRect:bounds];
    UIGraphicsPopContext();
}

- (void)removeTiledLayer {
    UIView *tiledView = [self.view viewWithTag:1001];
    if (tiledView) [tiledView removeFromSuperview];
}

@end
