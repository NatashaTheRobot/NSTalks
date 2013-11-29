//
//  MenuViewController.h
//  NSTalks
//
//  Created by Natasha Murashev on 11/28/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

typedef NS_ENUM(NSUInteger, PaneViewControllerType) {
    PaneViewControllerTypeUpcomingEvents
};

@interface MenuViewController : UITableViewController

@property (nonatomic, assign)   PaneViewControllerType          paneViewControllerType;
@property (nonatomic, weak)     MSDynamicsDrawerViewController *dynamicsDrawerViewController;

- (void)transitionToViewController:(PaneViewControllerType)paneViewControllerType;

@end
