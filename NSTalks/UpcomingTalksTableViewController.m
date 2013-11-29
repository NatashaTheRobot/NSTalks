//
//  UpcomingTalksTableViewController.m
//  NSTalks
//
//  Created by Natasha Murashev on 11/29/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

#import "UpcomingTalksTableViewController.h"

@interface UpcomingTalksTableViewController ()

@end

@implementation UpcomingTalksTableViewController

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
    static NSString *CellIdentifier = @"talkCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = @"hello";
    
    return cell;
}


@end
