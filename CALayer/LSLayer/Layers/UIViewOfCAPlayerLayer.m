//
//  UIViewOfCAPlayerLayer.m
//  LSLayer
//
//  Created by Marshal on 2017/9/13.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "UIViewOfCAPlayerLayer.h"
#import <AVFoundation/AVFoundation.h>

@implementation UIViewOfCAPlayerLayer

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"KBS" ofType:@"mp4"];
    if (!path) {
        NSLog(@"不存在视频文件，请自己拖入视频文件！");
        return;
    }
    AVPlayer *player = [AVPlayer playerWithURL:[NSURL fileURLWithPath:path isDirectory:NO]];
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player];
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    layer.videoGravity = AVLayerVideoGravityResizeAspect;
    layer.position = self.center;
    layer.bounds = CGRectMake(0, 0, 300, 200);
    [self.layer addSublayer:layer];
    [player play];
}

@end
