//
//  ViewController.m
//  LSLayer
//
//  Created by Marshal on 2017/9/11.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "ViewController.h"
#import "LSLayerModel.h"

@interface ViewController ()<CALayerDelegate>
{
    UIView *baseView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self initLay];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)onClickToOperate:(UIButton *)sender {
    CGRect rect = {self.view.frame.origin,CGSizeMake(self.view.frame.size.width, self.view.frame.size.height - 100)};
    switch (sender.tag) {
        case 1:{
            baseView = [[UIViewOfCAShaperLayer alloc] initWithFrame:rect];
            [self.view addSubview:baseView];
        }break;
        case 2:{
            baseView = [[UIViewOfCAGradientLayer alloc] initWithFrame:rect];
            [self.view addSubview:baseView];
        }break;
        case 3:{
            baseView = [[UIViewOfEmitterLayer alloc] initWithFrame:rect];
            baseView.backgroundColor = [UIColor blackColor];
            [self.view addSubview:baseView];
        }return;
        case 4:{
            baseView = [[UIViewOfCATransformLayer alloc] initWithFrame:rect];
            baseView.backgroundColor = [UIColor whiteColor];
            [self.view addSubview:baseView];
        }return;
        case 5:{
            baseView = [[UIViewOfCAReplicatorLayer alloc] initWithFrame:rect];
            [self.view addSubview:baseView];
        }break;
        case 6:{
            baseView = [[UIViewOfCAScrollLayer alloc] initWithFrame:rect];
            [self.view addSubview:baseView];
        }break;
        case 7:{
            //由于该方法不在vc中可能获取不到上下文的问题可能会崩溃，所以要特殊处理
            [self initLay];
        }break;
        case 8:{
            baseView = [[UIViewOfCATextLayer alloc] initWithFrame:rect];
            [self.view addSubview:baseView];
        }break;
        case 9:{
            baseView = [[UIViewOfCAPlayerLayer alloc] initWithFrame:rect];
            [self.view addSubview:baseView];
        }break;
        default: {
            if (baseView) [baseView removeFromSuperview];
            else [self removeTiledLayer];
        }break;
    }
    if (baseView) baseView.backgroundColor = [UIColor grayColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
