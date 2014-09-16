//
//  TransitionContextManager.h
//  CustomViewControllerTransitionsExample
//
//  Created by Jeff Hurray on 9/8/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NavigationTransitionManager.h"
#import "ModalTransitionManager.h"

typedef NS_ENUM(NSUInteger, ModalTransitionType){
    ModalTransitionTypeDefault,
    ModalTransitionTypeBounceUp,
    ModalTransitionTypePullBack
};

typedef NS_ENUM(NSUInteger, NavigationTransitionType){
    NavigationTransitionTypeDefault,
    NavigationTransitionTypeZoom,
    NavigationTransitionTypeDropDown
};

@interface TransitionContextManager : NSObject

+(id)sharedInstance;

@property (nonatomic, weak, readonly) ModalTransitionManager *modalTransitionManager;
@property (nonatomic, weak, readonly) NavigationTransitionManager *navigationTransitionManager;
@property (nonatomic, assign) ModalTransitionType modalTransitionType;
@property (nonatomic, assign) NavigationTransitionType navigationTransitionType;

@end
