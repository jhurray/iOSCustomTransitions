//
//  JHModalTransitionManager.m
//  CustomViewControllerTransitionsExample
//
//  Created by Jeff Hurray on 9/6/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import "JHModalTransitionManager.h"

@interface JHModalTransitionManager()


@end

@implementation JHModalTransitionManager

-(void)animatePresentTransitionFrom:(UIViewController *)fromVC to:(UIViewController *)toVC withTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    MustOverride();
}

-(void) animateDismissTransitionFrom:(UIViewController *)fromVC to:(UIViewController *)toVC withTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    MustOverride();
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.transitionType == TransitionTypePresent) {
        return 1.0;
    } else {
        return 0.4;
    }
}


@end
