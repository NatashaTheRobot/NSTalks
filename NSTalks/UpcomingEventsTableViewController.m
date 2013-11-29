//
//  UpcomingTalksTableViewController.m
//  NSTalks
//
//  Created by Natasha Murashev on 11/29/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

#import "UpcomingEventsTableViewController.h"

NSString * const kCellIdentifierEvent = @"eventCell";

@interface UpcomingEventsTableViewController ()

@end

@implementation UpcomingEventsTableViewController

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifierEvent forIndexPath:indexPath];
    
    cell.textLabel.text = @"hello";
    
    return cell;
}


@end
