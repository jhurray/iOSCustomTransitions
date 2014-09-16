//
//  JHBaseViewController.m
//  CustomViewControllerTransitionsExample
//
//  Created by Jeff Hurray on 9/8/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import "JHBaseViewController.h"

@interface JHBaseViewController ()


@end

@implementation JHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    
    [self setupModalViewControllerForCustomTransition:viewControllerToPresent];
    [super presentViewController:viewControllerToPresent animated:flag completion:^{
        completion();
    }];
    
}

# pragma mark MODAL TRANSITIONS

-(void)setupModalViewControllerForCustomTransition:(UIViewController *)modalVC {
    modalVC.modalPresentationStyle = UIModalPresentationCustom;
    modalVC.transitioningDelegate = self;
}

-(id <UIViewControllerAnimatedTransitioning>) animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    JHModalTransitionManager *JHModalTransitionManager = [[JHTransitionContextManager sharedInstance] modalTransitionManager];
    JHModalTransitionManager.transitionType = TransitionTypePresent;
    return JHModalTransitionManager;
}

-(id <UIViewControllerAnimatedTransitioning>) animationControllerForDismissedController:(UIViewController *)dismissed{
    JHModalTransitionManager *JHModalTransitionManager = [[JHTransitionContextManager sharedInstance] modalTransitionManager];
    JHModalTransitionManager.transitionType = TransitionTypeDismiss;
    return JHModalTransitionManager;
}

# pragma mark NAVIGATION TRANSITIONS

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    JHNavigationTransitionManager *navTransitionManager = [[JHTransitionContextManager sharedInstance] navigationTransitionManager];
    switch (operation) {
        case UINavigationControllerOperationPush:
            navTransitionManager.transitionType = TransitionTypePresent;
            return navTransitionManager;
        case UINavigationControllerOperationPop:
            navTransitionManager.transitionType = TransitionTypeDismiss;
            return navTransitionManager;
        default:
            return nil;
    }
}

#pragma mark INTERACTIVE TRANSITIONS

-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    
    // IMPLEMENT LATER
    
    return nil;
}

@end
