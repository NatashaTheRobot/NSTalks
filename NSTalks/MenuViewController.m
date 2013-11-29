//
//  MenuViewController.m
//  NSTalks
//
//  Created by Natasha Murashev on 11/28/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuTableViewCell.h"

@interface MenuViewController ()

@property (strong, nonatomic) NSArray *menuOptions;
@property (strong, nonatomic) NSArray *paneViewControllerIdentifiers;
@property (nonatomic, strong) UIBarButtonItem *paneRevealLeftBarButtonItem;

@end

@implementation MenuViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.paneViewControllerType = NSUIntegerMax;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorColor = [UIColor colorWithWhite:1.0 alpha:0.25];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.menuOptions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(MenuTableViewCell.class) forIndexPath:indexPath];
    
    [cell configureCellWithText:self.menuOptions[indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PaneViewControllerType paneViewControllerType = indexPath.row;
    [self transitionToViewController:paneViewControllerType];

    // Prevent visual display bug with cell dividers
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [tableView reloadData];
    });
}

#pragma mark - Private Methods

- (void)transitionToViewController:(PaneViewControllerType)paneViewControllerType
{
    // Close pane if already displaying that pane view controller
    if (paneViewControllerType == self.paneViewControllerType) {
        [self.dynamicsDrawerViewController setPaneState:MSDynamicsDrawerPaneStateClosed
                                               animated:YES allowUserInterruption:YES
                                             completion:nil];
        return;
    }
    
    BOOL animateTransition = self.dynamicsDrawerViewController.paneViewController != nil;
    
    UINavigationController *paneNavigationViewController = [self.storyboard instantiateViewControllerWithIdentifier:self.paneViewControllerIdentifiers[paneViewControllerType]];
    
    [self.dynamicsDrawerViewController setPaneViewController:paneNavigationViewController animated:animateTransition completion:nil];
    self.paneViewControllerType = paneViewControllerType;
}

#pragma mark - Setter / Getter Overrides

- (NSArray *)menuOptions
{
    if (!_menuOptions) {
        self.menuOptions = @[@"Upcoming Talks"];
    }
    return _menuOptions;
}

- (NSArray *)paneViewControllerIdentifiers
{
    if (!_paneViewControllerIdentifiers) {
        self.paneViewControllerIdentifiers = @[@"UpcomingEventsNavigationViewController"];
    }
    return _paneViewControllerIdentifiers;
}

@end
