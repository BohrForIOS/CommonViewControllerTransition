//
//  ViewController.m
//  CustomPresent
//
//  Created by 王二 on 17/2/7.
//  Copyright © 2017年 mbs008. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "PresentAnimator.h"
#import "DismissAnimator.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presentBtnTouch:(UIButton *)sender {
    SecondViewController *secVC = [SecondViewController new];
    secVC.view.frame = CGRectMake(20, 100, 320, 400);
    secVC.transitioningDelegate = self;
    secVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:secVC animated:YES completion:^{
        
    }];
}

#pragma mark - UIViewControllerTransitioningDelegate定制转场动画（present与dismiss动画代理）

/// present动画
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                            presentingController:(UIViewController *)presenting
                                                                                sourceController:(UIViewController *)source {
    return [PresentAnimator new];
}

/// dismiss动画

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    DismissAnimator *dismissAnimator = [DismissAnimator new];
    dismissAnimator.transitionDuration = 0.4f;
    
    return dismissAnimator;
}

@end
