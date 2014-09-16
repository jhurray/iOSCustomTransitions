//
//  JHPullBackModalTransitionManager.m
//  CustomViewControllerTransitionsExample
//
//  Created by Jeff Hurray on 9/11/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import "JHPullBackModalTransitionManager.h"

@interface JHPullBackModalTransitionManager()

@end

@implementation JHPullBackModalTransitionManager

-(void)animatePresentTransitionFrom:(UIViewController *)fromVC to:(UIViewController *)toVC withTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {

    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    UIView *containerView = [transitionContext containerView];
    CGRect toEndFrame  = toVC.view.frame;
    CGRect toStartFrame = CGRectMake( 0, screenBounds.size.height, screenBounds.size.width, screenBounds.size.height);
    [toVC.view setFrame:toStartFrame];
    [containerView insertSubview:toVC.view aboveSubview:fromVC.view];
    CGAffineTransform shrink = CGAffineTransformMakeScale(0.95, 0.95);
    CGAffineTransform shiftDown = CGAffineTransformMakeTranslation(0, 20);
    CGAffineTransform shrinkAndShift = CGAffineTransformConcat(shrink, shiftDown);
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0.0 options:0 animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.3 animations:^{
            fromVC.view.transform = shrinkAndShift;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:[self transitionDuration:transitionContext] animations:^{
            [toVC.view setFrame:toEndFrame];
        }];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

-(void) animateDismissTransitionFrom:(UIViewController *)fromVC to:(UIViewController *)toVC withTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *modalView = fromVC.view;
    UIView *modalSnapshot = [modalView snapshotViewAfterScreenUpdates:NO];
    modalSnapshot.frame = modalView.frame;
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:modalSnapshot];
    [containerView bringSubviewToFront:modalSnapshot];
    [modalView removeFromSuperview];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect toEndFrame = CGRectMake(0, screenBounds.size.height, screenBounds.size.width, screenBounds.size.height);
    
    CGAffineTransform grow = CGAffineTransformMakeScale(1.0, 1.0);
    
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0.0 options:0 animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:[self transitionDuration:transitionContext] animations:^{
            [modalSnapshot setFrame:toEndFrame];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.3   relativeDuration:0.3 animations:^{
            toVC.view.transform = grow;
        }];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

-(NSTimeInterval) transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.7;
}

@end
