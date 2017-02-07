//
//  DismissAnimator.m
//  CustomPresent
//
//  Created by 王二 on 17/2/7.
//  Copyright © 2017年 mbs008. All rights reserved.
//

#import "DismissAnimator.h"

@implementation DismissAnimator

- (void)animateTransitionEvent {
    
    // 当前控制器的view
    UIView *currentView = self.fromViewController.view;
    
    // 变化的控制器的view
    UIView *toView   = self.toViewController.view;
    toView.transform = CGAffineTransformMakeScale(0.7, 0.7);
    
    // 执行动画
    [UIView animateWithDuration:self.transitionDuration
                          delay:0.f
         usingSpringWithDamping:1.f
          initialSpringVelocity:0.f
                        options:0
                     animations:^{
                         currentView.y    = Height;
                         toView.transform = CGAffineTransformMakeScale(1.f, 1.f);
                     }
                     completion:^(BOOL finished) {
                         [self completeTransition];
                     }];
}

@end
