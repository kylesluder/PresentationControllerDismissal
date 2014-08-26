//
//  ViewController.h
//  PresentationControllerDismissal
//
//  Created by Kyle Sluder on 8/25/14.
//  Copyright (c) 2014 Kyle Sluder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomContainerViewController : UIViewController
@end

@interface RootViewController : UIViewController

- (IBAction)presentAPresentableViewController:(id)sender;

@end

@interface PresentableViewController : UIViewController

@property (copy) void (^dismissHandler)(void);
- (IBAction)askRootToDismissMe:(id)sender;

@end

