//
//  KFStyledSegmentedControl.m
//  KFSegmentControlExample
//
//  Created by Kevin Ferrell on 7/27/13.
//  Copyright (c) 2013 KF. All rights reserved.
//

#import "KFStyledSegmentedControl.h"

// This must match the height of the background graphic
#define kStyledSegmentedControlHeight 41

@interface KFStyledSegmentedControl()

// Image view containing the arrow image of the selected segment
@property UIImageView *segmentArrow;

@end


@implementation KFStyledSegmentedControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Style the table
        UIImage *backgroundOff = [UIImage imageNamed:@"segmentbk_off"];
        UIImage *backgroundOn = [UIImage imageNamed:@"segmentbk_on"];
        UIImage *seperator = [UIImage imageNamed:@"segmentbk_seperator"];
        UIImage *arrow = [UIImage imageNamed:@"segment_arrow"];
        
        // Height
        [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, kStyledSegmentedControlHeight)];
        
        // Background
        [self setBackgroundImage:backgroundOff forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [self setBackgroundImage:backgroundOn forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        
        // Seperator
        [self setDividerImage:seperator forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [self setDividerImage:seperator forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [self setDividerImage:seperator forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        
        // Font
        UIFont *font = [UIFont fontWithName:@"Arial-BoldMT" size:16.0];
        UIColor *fontColor = [UIColor colorWithRed:55.0/255.0 green:71.0/255.0 blue:106.0/255.0 alpha:1.0];
        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, UITextAttributeFont, fontColor, UITextAttributeTextColor, [UIColor clearColor], UITextAttributeTextShadowColor, nil];
        [self setTitleTextAttributes:attributes forState:UIControlStateNormal];
        [self setTitleTextAttributes:attributes forState:UIControlStateSelected];
        
        // Arrow Indicator
        self.segmentArrow = [[UIImageView alloc] initWithImage:arrow];
        
        // Handle selected segment changes by displaying the bottom arrow on the selected segment
        [self addTarget:self action:@selector(selectedSegmentChanged:) forControlEvents:UIControlEventValueChanged];
    }
    
    return self;
}

// Capitalize Titles
- (id)initWithItems:(NSArray *)items
{
    NSMutableArray *newItems = [[NSMutableArray alloc] initWithCapacity:items.count];
    for (int i = 0; i < items.count; i++) {
        newItems[i] = [items[i] uppercaseString];
    }
    
    return [super initWithItems:newItems];
}

// Capitalize Titles
- (void)setTitle:(NSString *)title forSegmentAtIndex:(NSUInteger)segment
{
    [super setTitle:[title uppercaseString] forSegmentAtIndex:segment];
}

- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex
{
    [super setSelectedSegmentIndex:selectedSegmentIndex];
    
    // Add the arrow to the selected segment
    [self selectedSegmentChanged:nil];
}

- (void)selectedSegmentChanged:(id)sender
{
    // Remove the arrow from its current view
    [self.segmentArrow removeFromSuperview];
    
    // The segment items are added in reverse order of their index so we need to flip the selected index
    NSInteger viewIndex = self.numberOfSegments - 1 - self.selectedSegmentIndex;
    
    // Get a reference to the segment and position the arrow outside of its frame
    UIView *segmentView = [self.subviews objectAtIndex:viewIndex];
    [segmentView addSubview:self.segmentArrow];
    self.segmentArrow.center = CGPointMake(segmentView.frame.size.width / 2, kStyledSegmentedControlHeight + self.segmentArrow.frame.size.height / 2);
}

@end
