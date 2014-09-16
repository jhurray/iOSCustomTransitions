//
//  JHTransitionContextManager.m
//  CustomViewControllerTransitionsExample
//
//  Created by Jeff Hurray on 9/8/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import "JHTransitionContextManager.h"

#pragma mark Modal Transition Managers
#import "JHBounceUpModalTransitionManager.h"
#import "JHPullBackModalTransitionManager.h"

#pragma mark Nav Transition Managers
#import "JHZoomNavigationTransitionManager.h"
#import "JHDropDownNavigationTransitionManager.h"

@implementation JHTransitionContextManager

-(id)init {
    if(self = [super init]){
        self.navigationTransitionType = JHNavigationTransitionTypeDefault;
        self.modalTransitionType = JHModalTransitionTypeDefault;
    }
    return self;
}

+(id)sharedInstance {
    static JHTransitionContextManager *sharedTransitionContext = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedTransitionContext = [[self alloc] init];
    });
    return sharedTransitionContext;
}

-(JHModalTransitionManager *)modalTransitionManager {
    
    switch (self.modalTransitionType) {
        case JHModalTransitionTypeDefault:
            return nil;
            break;
        case JHModalTransitionTypeBounceUp:
            return [[JHBounceUpModalTransitionManager alloc] init];
        case JHModalTransitionTypePullBack:
            return [[JHPullBackModalTransitionManager alloc] init];
        default:
            return nil;
            break;
    }
    return nil;
}

-(JHNavigationTransitionManager *)navigationTransitionManager {
    
    switch (self.navigationTransitionType) {
        case JHNavigationTransitionTypeDefault:
            return nil;
            break;
        case JHNavigationTransitionTypeZoom:
            return [[JHZoomNavigationTransitionManager alloc] init];
            break;
        case JHNavigationTransitionTypeDropDown:
            return [[JHDropDownNavigationTransitionManager alloc] init];
            break;
        default:
            return nil;
            break;
    }
    return nil;
}


@end
