//
//  ViewController.m
//  PresentationControllerDismissal
//
//  Created by Kyle Sluder on 8/25/14.
//  Copyright (c) 2014 Kyle Sluder. All rights reserved.
//

#import "ViewController.h"

@implementation CustomContainerViewController

- (void)viewDidLoad;
{
    UIViewController *embedded = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"embedded"];
    
    [self addChildViewController:embedded];
    UIView *embeddedView = embedded.view;
    embeddedView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIView *thisView = self.view;
    [thisView addSubview:embeddedView];
    
    [NSLayoutConstraint constraintWithItem:embeddedView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:thisView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:embeddedView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:thisView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:embeddedView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:thisView attribute:NSLayoutAttributeWidth multiplier:0.5f constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:embeddedView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:thisView attribute:NSLayoutAttributeHeight multiplier:0.5f constant:0].active = YES;
    
    [embedded didMoveToParentViewController:self];
    
    [super viewDidLoad];
}

@end

@implementation RootViewController

- (void)presentAPresentableViewController:(id)sender;
{
    PresentableViewController *presentable = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"presentable"];
    presentable.dismissHandler = ^{
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    };
    presentable.modalPresentationStyle = UIModalPresentationCurrentContext;
    [self.navigationController presentViewController:presentable animated:YES completion:nil];
}

@end

@implementation PresentableViewController

- (void)askRootToDismissMe:(id)sender;
{
    _dismissHandler();
}

@end
