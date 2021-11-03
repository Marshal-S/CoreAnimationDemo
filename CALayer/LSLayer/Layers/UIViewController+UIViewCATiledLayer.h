//
//  UIViewController+UIViewCATiledLayer.h
//  LSLayer
//
//  Created by Marshal on 2017/9/14.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (UIViewCATiledLayer)<CALayerDelegate>

- (void)initLay;

- (void)removeTiledLayer;

@end
