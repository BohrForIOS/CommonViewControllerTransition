//
//  BaseAnimator.m
//  CustomPresent
//
//  Created by 王二 on 17/2/7.
//  Copyright © 2017年 mbs008. All rights reserved.
//

#import "BaseAnimator.h"

@interface BaseAnimator ()

@property (nonatomic, weak) id <UIViewControllerContextTransitioning> transitionContext;

@property (nonatomic, weak) UIViewController  *fromViewController;
@property (nonatomic, weak) UIViewController  *toViewController;
@property (nonatomic, weak) UIView            *containerView;

@end

@implementation BaseAnimator

#pragma mark - 初始化
- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        // 默认参数设置
        [self deafultSet];
    }
    
    return self;
}

- (void)deafultSet {
    
    _transitionDuration = 0.5f;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    return _transitionDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    self.fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    self.toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    self.containerView      = [transitionContext containerView];
    self.transitionContext  = transitionContext;
    
    [self animateTransitionEvent];
}

- (void)animateTransitionEvent {
    
    /* == 代码示例 ==
     
     UIView *tmpView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
     [self.containerView addSubview:self.toViewController.view];
     [self.containerView addSubview:tmpView];
     
     [UIView animateWithDuration:self.transitionDuration
     delay:0.0f
     usingSpringWithDamping:1 initialSpringVelocity:0.f options:0 animations:^{
     
     tmpView.frame = CGRectMake(0, 0, 100, 100);
     
     } completion:^(BOOL finished) {
     
     [tmpView removeFromSuperview];
     [self completeTransition];
     }];
     */
}

#pragma mark -

- (void)completeTransition {
    // UIViewControllerContextTransitioning协议方法，当转场完成时必须回调，一般由遵守UIViewControllerAnimatedTransitioning协议的对象回调
    [self.transitionContext completeTransition:!self.transitionContext.transitionWasCancelled];
}

@end
