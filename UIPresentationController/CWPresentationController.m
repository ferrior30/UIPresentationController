//
//  CWPresentationController.m
//  UIPresentationController
//
//  Created by ChenWei on 16/5/18.
//  Copyright © 2016年 cw. All rights reserved.
//

#import "CWPresentationController.h"
#import "SecondViewController.h"

@implementation CWPresentationController
//MARK: - UIViewControllerTransitioningDelegate
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return self;
}

//MARK: - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

}

- (CGSize)preferredContentSize {
    return self.presentedViewController.preferredContentSize;
//    return [super preferredContentSize];
//    return CGSizeMake(300, 600);
}



//- (UIView *)presentedView {
//    NSLog(@"%s", __func__);
//    CGRect rect = CGRectMake(40, 150, self.preferredContentSize.width, self.preferredContentSize.height);
//    self.presentedViewController.view.frame = rect;
////    return  _presentedView;
//    return self.presentedViewController.view;
//}

//- (UIView *)containerView {
//    CGRect rect = CGRectMake(40, 150, self.preferredContentSize.width, self.preferredContentSize.height);
//    super.containerView.frame = rect;
//    return super.containerView;
//}


//- (void)containerViewDidLayoutSubviews {
//    [super containerViewDidLayoutSubviews];
//    
////    self.presentedView.frame = self.frameOfPresentedViewInContainerView;
//}

//- (void)containerViewDidLayoutSubviews {
//    [super containerViewDidLayoutSubviews];
//    
//}

- (void)containerViewWillLayoutSubviews {
    [super containerViewWillLayoutSubviews];
    self.containerView.autoresizingMask=  UIViewAutoresizingNone;
    
    self.presentedView.frame = self.frameOfPresentedViewInContainerView;
}




//- (CGSize)sizeForChildContentContainer:(id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//    return [container preferredContentSize];
////    return self.preferredContentSize;
//}


- (void)preferredContentSizeDidChangeForChildContentContainer:(id<UIContentContainer>)container
{
    [super preferredContentSizeDidChangeForChildContentContainer:container];
    
    if (container == self.presentedViewController)
        [self.containerView setNeedsLayout];
}

- (CGRect)frameOfPresentedViewInContainerView
{
    CGRect containerViewBounds = self.containerView.bounds;
    containerViewBounds.size.height = self.preferredContentSize.height;
    containerViewBounds.size.width = self.preferredContentSize.width;
//    CGSize presentedViewContentSize = [self sizeForChildContentContainer:self.presentedViewController withParentContainerSize:containerViewBounds.size];
    
    // The presented view extends presentedViewContentSize.height points from
    // the bottom edge of the screen.
//    CGRect presentedViewControllerFrame = containerViewBounds;
//    presentedViewControllerFrame.size.height = presentedViewContentSize.height;
//    presentedViewControllerFrame.origin.y = CGRectGetMaxY(containerViewBounds) - presentedViewContentSize.height;
//    return presentedViewControllerFrame;
    NSLog(@"%@", NSStringFromCGRect(self.presentedView.frame));
//    return  self.containerView.frame;
    return containerViewBounds;
}

- (CGSize)sizeForChildContentContainer:(id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize
{
    if (container == self.presentedViewController)
        return ((UIViewController*)container).preferredContentSize;
    else
        return [super sizeForChildContentContainer:container withParentContainerSize:parentSize];
}



@end
