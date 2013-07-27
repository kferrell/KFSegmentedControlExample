//
//  KFAppDelegate.h
//  KFSegmentControlExample
//
//  Created by Kevin Ferrell on 7/27/13.
//  Copyright (c) 2013 KF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KFTableViewController.h"

@class KFViewController;

@interface KFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) KFTableViewController *viewController;

@end
