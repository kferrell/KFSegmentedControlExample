//
//  KFTableViewController.h
//  KFSegmentControlExample
//
//  Created by Kevin Ferrell on 7/27/13.
//  Copyright (c) 2013 KF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KFStyledSegmentedControl.h"

@interface KFTableViewController : UITableViewController

// Store the two alternating lists to display
@property (nonatomic) NSArray *listA;
@property (nonatomic) NSArray *listB;
@property (nonatomic) NSArray *selectedList;

// Store a reference to the segmented control
@property (nonatomic) KFStyledSegmentedControl *segmentedControl;

@end
