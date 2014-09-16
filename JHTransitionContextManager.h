//
//  JHTransitionContextManager.h
//  CustomViewControllerTransitionsExample
//
//  Created by Jeff Hurray on 9/8/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHNavigationTransitionManager.h"
#import "JHModalTransitionManager.h"

typedef NS_ENUM(NSUInteger, JHModalTransitionType){
    JHModalTransitionTypeDefault,
    JHModalTransitionTypeBounceUp,
    JHModalTransitionTypePullBack
};

typedef NS_ENUM(NSUInteger, JHNavigationTransitionType){
    JHNavigationTransitionTypeDefault,
    JHNavigationTransitionTypeZoom,
    JHNavigationTransitionTypeDropDown
};

@interface JHTransitionContextManager : NSObject

+(id)sharedInstance;

@property (nonatomic, weak, readonly) JHModalTransitionManager *modalTransitionManager;
@property (nonatomic, weak, readonly) JHNavigationTransitionManager *navigationTransitionManager;
@property (nonatomic, assign) JHModalTransitionType modalTransitionType;
@property (nonatomic, assign) JHNavigationTransitionType navigationTransitionType;

@end
