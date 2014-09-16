

Custom animation transition manager and base VC for iOS apps. 

##Use:  

1. Clone repo
2. Add files to your XCode project (make sure you delete the README.md file)
3. Subclass whatever view controller you are making from JHBaseViewController
4. In viewDidLoad add the following lines of code with whatever transition type you want. This will determine the animations that will be used.

```objective-c
// replace with another JHNavigationTransitionType for custom navigation transition
[[JHTransitionContextManager sharedInstance] setNavigationTransitionType:JHNavigationTransitionTypeDefault];
// replace with another JHModalTransitionType for custom modal transition
[[JHTransitionContextManager sharedInstance] setModalTransitionType:JHModalTransitionTypeDefault];
```
5. Push, Pop, Present and Dismiss like you normally would!

##Custom Animations:

To create a custom modal or navigation animation subclass JHModalTransitionManager and JHNavigationTransitionManager respectively.  

Then, override the following methods:  

```objective-c
-(void)animatePresentTransitionFrom:(UIViewController *)fromVC to:(UIViewController *)toVC withTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    MustOverride();
}

-(void) animateDismissTransitionFrom:(UIViewController *)fromVC to:(UIViewController *)toVC withTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    MustOverride();
}
```

Also override:

```objective-c
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.transitionType == TransitionTypePresent) { // push and present
        return 1.0;
    } else { // dismissing and popping
        return 0.4;
    }
}
```
to set the animation duration. 

##Built-in Transitions

#####Navigation:
+ JHNavigationTransitionTypeZoom
+ JHNavigationTransitionTypeDropDown

#####Modal:
+ JHModalTransitionTypeBounceUp
+ JHModalTransitionTypePullBack

##Moving Forward:  

1. Interactive transitions
2. More animations