//
//  BaseViewController.m
//  CustomViewControllerTransitionsExample
//
//  Created by Jeff Hurray on 9/8/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()


@end

@implementation BaseViewController

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
    
    ModalTransitionManager *modalTransitionManager = [[TransitionContextManager sharedInstance] modalTransitionManager];
    modalTransitionManager.transitionType = TransitionTypePresent;
    return modalTransitionManager;
}

-(id <UIViewControllerAnimatedTransitioning>) animationControllerForDismissedController:(UIViewController *)dismissed{
    ModalTransitionManager *modalTransitionManager = [[TransitionContextManager sharedInstance] modalTransitionManager];
    modalTransitionManager.transitionType = TransitionTypeDismiss;
    return modalTransitionManager;
}

# pragma mark NAVIGATION TRANSITIONS

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    NavigationTransitionManager *navTransitionManager = [[TransitionContextManager sharedInstance] navigationTransitionManager];
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
