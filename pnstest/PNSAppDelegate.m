//
//  PNSAppDelegate.m
//  pnstest
//
//  Created by Andrey Kozeletsky on 3/16/14.
//  Copyright (c) 2014 AVKSoftware. All rights reserved.
//

#import "PNSAppDelegate.h"

@implementation PNSAppDelegate

static NSString *_deviceTokenKey = @"deviceToken";

#pragma mark - Static methods

+ (NSString*)deviceToken
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:_deviceTokenKey];
}

+ (void)setDeviceToken:(NSData*)tokenData
{
    NSCharacterSet *charactersToRemove = [NSCharacterSet characterSetWithCharactersInString:@"<> "];
    NSString *result = [[[NSString stringWithFormat:@"%@",tokenData] componentsSeparatedByCharactersInSet:charactersToRemove] componentsJoinedByString: @""];
    
    [[NSUserDefaults standardUserDefaults] setValue:result forKey:_deviceTokenKey];
}


#pragma mark -

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound)];
    
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

#pragma mark - APNS

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [[self class] setDeviceToken:deviceToken];
    NSLog(@"deviceToken: %@", [[self class] deviceToken]);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    // TODO: Implementation
    NSLog(@"error: %@", error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    // TODO: Implementation
    NSLog(@"userInfo: %@", userInfo);
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    // TODO: Implementation
    NSLog(@"notification: %@", notification);
}

@end
