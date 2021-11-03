
//
//  LSLayerModel.h
//  LSLayer
//
//  Created by Marshal on 2017/9/11.
//  Copyright © 2017年 Marshal. All rights reserved.
//

typedef NS_ENUM(NSUInteger, LSTypeLayer) {
    LSTypeLayerShaperLayer,
    LSTypeLayerGradientLayer,
    LSTypeLayerCAEmitterLayer,
    LSTypeLayerCATransformLayer
};

#import "UIViewOfCAShaperLayer.h"
#import "UIViewOfCAGradientLayer.h"
#import "UIViewOfEmitterLayer.h"
#import "UIViewOfCATransformLayer.h"
#import "UIViewOfCAReplicatorLayer.h"
#import "UIViewOfCAScrollLayer.h"
#import "UIViewController+UIViewCATiledLayer.h"
#import "UIViewOfCATextLayer.h"
#import "UIViewOfCAPlayerLayer.h"
