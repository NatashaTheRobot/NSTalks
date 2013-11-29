//
//  UpcomingTalksTableViewController.m
//  NSTalks
//
//  Created by Natasha Murashev on 11/29/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

#import "UpcomingEventsTableViewController.h"
#import "EventTableViewCell.h"
#import "Event.h"

@interface UpcomingEventsTableViewController ()

@end

@implementation UpcomingEventsTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.parseClassName = NSStringFromClass(Event.class);
        self.pullToRefreshEnabled = YES;
        self.paginationEnabled = YES;
        self.objectsPerPage = 100;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Actions

- (IBAction)onMenuBarButtonTap:(id)sender
{
    MSDynamicsDrawerViewController *dynamicsDrawerViewController = (MSDynamicsDrawerViewController *)self.navigationController.parentViewController;
    [dynamicsDrawerViewController setPaneState:MSDynamicsDrawerPaneStateOpen
                                   inDirection:MSDynamicsDrawerDirectionLeft
                                      animated:YES
                         allowUserInterruption:YES
                                    completion:nil];
}

#pragma mark - Parse

- (PFQuery *)queryForTable
{
    PFQuery *query = [Event query];
    
    // If no objects are loaded in memory, we look to the cache first to fill the table
    // and then subsequently do a query against the network.
    if ([self.objects count] == 0) {
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
    
    [query orderByAscending:@"title"];
    
    return query;
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(Event *)event
{
    EventTableViewCell *eventCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(EventTableViewCell.class) forIndexPath:indexPath];
    eventCell.event = event;
    
    return eventCell;
}

@end
