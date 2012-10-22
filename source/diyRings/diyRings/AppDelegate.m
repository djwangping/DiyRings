//
//  AppDelegate.m
//  diyRings
//
//  Created by wangping on 12-10-22.
//  Copyright (c) 2012年 lcywp. All rights reserved.
//

#import "AppDelegate.h"

#import "SettingViewController.h"
#import "MyRingsViewController.h"
#import "RecordViewController.h"
#import "DiyRingsViewController.h"
#import "OnlineRingsViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    UIViewController *settingViewController = [[[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil] autorelease];
    UIViewController *myringsViewController = [[[MyRingsViewController alloc] initWithNibName:@"MyRingsViewController" bundle:nil] autorelease];
    UIViewController *recordViewController = [[[RecordViewController alloc] initWithNibName:@"RecordViewController" bundle:nil] autorelease];
    UIViewController *diyViewController = [[[DiyRingsViewController alloc] initWithNibName:@"DiyRingsViewController" bundle:nil] autorelease];
    UIViewController *onlineViewController = [[[OnlineRingsViewController alloc] initWithNibName:@"OnlineRingsViewController" bundle:nil] autorelease];
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = @[onlineViewController,diyViewController,recordViewController,myringsViewController,settingViewController];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
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

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
