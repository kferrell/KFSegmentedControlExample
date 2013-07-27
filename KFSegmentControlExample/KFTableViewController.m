//
//  KFTableViewController.m
//  KFSegmentControlExample
//
//  Created by Kevin Ferrell on 7/27/13.
//  Copyright (c) 2013 KF. All rights reserved.
//

#import "KFTableViewController.h"
#import "KFStyledSegmentedControl.h"

@interface KFTableViewController ()

@end

@implementation KFTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Initialize the dummy data for the two lists
        NSMutableArray *listA = [[NSMutableArray alloc] init];
        NSMutableArray *listB = [[NSMutableArray alloc] init];
        
        [listA addObject:@"Item A1"];
        [listA addObject:@"Item A2"];
        [listA addObject:@"Item A3"];
        [listA addObject:@"Item A4"];
        [listB addObject:@"Item B1"];
        [listB addObject:@"Item B2"];
        [listB addObject:@"Item B3"];
        [listB addObject:@"Item B4"];
        
        self.listA = listA;
        self.listB = listB;
        
        // Set the default selection
        self.selectedList = self.listA;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Style the table
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [UIColor clearColor];
    
    // Create the styled segmented view controller and add to the table header
    UIView *segmentContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 55.0)];
    segmentContainer.backgroundColor = [UIColor whiteColor];
    self.segmentedControl = [[KFStyledSegmentedControl alloc] initWithItems:@[@"List a",@"List b"]];
    self.segmentedControl.frame = CGRectMake(self.segmentedControl.frame.origin.x, self.segmentedControl.frame.origin.y, segmentContainer.frame.size.width, self.segmentedControl.frame.size.height);
    [segmentContainer addSubview:self.segmentedControl];
    [self.segmentedControl addTarget:self action:@selector(changeDisplayedList:) forControlEvents:UIControlEventValueChanged];
    self.tableView.tableHeaderView = segmentContainer;

}

- (void)viewDidAppear:(BOOL)animated
{
    // Set the selected index after the view appears so that the segment widths can be calculated correctly
    self.segmentedControl.selectedSegmentIndex = 0;
}

- (void)changeDisplayedList:(id)sender
{
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            self.selectedList = self.listA;
            break;
        case 1:
            self.selectedList = self.listB;
            break;
        default:
            break;
    }
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.selectedList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        UIView *seperator = [[UIView alloc] initWithFrame:CGRectMake(0, cell.frame.size.height-1, self.tableView.contentSize.width, 1.0)];
        seperator.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:243.0/255.0 blue:246.0/255.0 alpha:1.0];
        [cell addSubview:seperator];
        cell.clipsToBounds = YES;
        cell.textLabel.textColor = [UIColor colorWithRed:96.0/255.0 green:105.0/255.0 blue:112.0/255.0 alpha:1.0];
        cell.textLabel.font = [UIFont fontWithName:@"ArialMT" size:16.0];
    }
    
    cell.textLabel.text = self.selectedList[indexPath.row];
    
    return cell;
}

@end
