//
//  AppDelegate.m
//  NSTalks
//
//  Created by Natasha Murashev on 11/28/13.
//  Copyright (c) 2013 NatashaTheRobot. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UIImageView *windowBackground;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self configureParseWithLaunchOptions:launchOptions];
    [self configureDynamicDrawerMenu];
    [self configureAppBackground];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Private Methods

- (void)configureDynamicDrawerMenu
{
    self.dynamicsDrawerViewController = (MSDynamicsDrawerViewController *)self.window.rootViewController;
    
    // Add some example stylers
    [self.dynamicsDrawerViewController addStylersFromArray:@[[MSDynamicsDrawerScaleStyler styler],
                                                             [MSDynamicsDrawerFadeStyler styler],
                                                             [MSDynamicsDrawerParallaxStyler styler]]
                                              forDirection:MSDynamicsDrawerDirectionLeft];
    
    MenuViewController *menuViewController = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(MenuViewController.class)];
    menuViewController.dynamicsDrawerViewController = self.dynamicsDrawerViewController;
    [self.dynamicsDrawerViewController setDrawerViewController:menuViewController forDirection:MSDynamicsDrawerDirectionLeft];
    
    // Transition to the first view controller
    [menuViewController transitionToViewController:PaneViewControllerTypeUpcomingTalks];
   
}

- (void)configureAppBackground
{
    [self.window makeKeyAndVisible];
    [self.window addSubview:self.windowBackground];
    [self.window sendSubviewToBack:self.windowBackground];
}

- (void)configureParseWithLaunchOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:PARSE_APPLICATION_ID clientKey:PARSE_CLIENT_KEY];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
}

#pragma mark - Setter / Getter Overrides

- (UIImageView *)windowBackground
{
    if (!_windowBackground) {
        self.windowBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    }
    return _windowBackground;
}

@end
