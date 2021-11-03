//
//  ViewController.m
//  CAAnimation
//
//  Created by Marshal on 2017/9/14.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "ViewController.h"
#import "LSAnimationModel.h"

@interface ViewController ()
{
    UIView *baseView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)onClickToOperate:(UIButton *)sender {
    CGRect rect = {self.view.frame.origin,CGSizeMake(self.view.frame.size.width, self.view.frame.size.height - 100)};
    switch (sender.tag) {
        case 1:{
            baseView = [[UIViewOfCABasicAnimation alloc] initWithFrame:rect];
            [self.view addSubview:baseView];
        }break;
        case 2:{
            baseView = [[UIViewOFBasicAnimations alloc] initWithFrame:rect];
            [self.view addSubview:baseView];
        }break;
        case 3:{
            baseView = [[UIViewOfCASpringAniamtion alloc] initWithFrame:rect];
            [self.view addSubview:baseView];
        }break;
        case 4:{
            baseView = [[UIViewOfCAKeyframeAnimation alloc] initWithFrame:rect];
            [self.view addSubview:baseView];
        }break;
        case 5:{
            baseView = [[UIViewOfCATransition alloc] initWithFrame:rect];
            [self.view addSubview:baseView];
        }break;
        case 6:{
            baseView = [[UIViewOfCAAnimationGroup alloc] initWithFrame:rect];
            [self.view addSubview:baseView];
        }break;

        default: {
            if (baseView) [baseView removeFromSuperview];
        }break;
    }
    if (baseView) baseView.backgroundColor = [UIColor grayColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
