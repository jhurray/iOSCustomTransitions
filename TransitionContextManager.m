//
//  TransitionContextManager.m
//  CustomViewControllerTransitionsExample
//
//  Created by Jeff Hurray on 9/8/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import "TransitionContextManager.h"

#pragma mark Modal Transition Managers
#import "BounceUpModalTransitionManager.h"
#import "PullBackModalTransitionManager.h"

#pragma mark Nav Transition Managers
#import "ZoomNavigationTransitionManager.h"
#import "DropDownNavigationTransitionManager.h"

@implementation TransitionContextManager

-(id)init {
    if(self = [super init]){
        self.navigationTransitionType = NavigationTransitionTypeDefault;
        self.modalTransitionType = ModalTransitionTypeDefault;
    }
    return self;
}

+(id)sharedInstance {
    static TransitionContextManager *sharedTransitionContext = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedTransitionContext = [[self alloc] init];
    });
    return sharedTransitionContext;
}

-(ModalTransitionManager *)modalTransitionManager {
    
    switch (self.modalTransitionType) {
        case ModalTransitionTypeDefault:
            return nil;
            break;
        case ModalTransitionTypeBounceUp:
            return [[BounceUpModalTransitionManager alloc] init];
        case ModalTransitionTypePullBack:
            return [[PullBackModalTransitionManager alloc] init];
        default:
            return nil;
            break;
    }
    return nil;
}

-(NavigationTransitionManager *)navigationTransitionManager {
    
    switch (self.navigationTransitionType) {
        case NavigationTransitionTypeDefault:
            return nil;
            break;
        case NavigationTransitionTypeZoom:
            return [[ZoomNavigationTransitionManager alloc] init];
            break;
        case NavigationTransitionTypeDropDown:
            return [[DropDownNavigationTransitionManager alloc] init];
            break;
        default:
            return nil;
            break;
    }
    return nil;
}


@end
