//
//  AppDelegate.m
//  ErrorTracking
//
//  Created by yuanjilee on 2019/6/14.
//  Copyright © 2019 YC Tech. All rights reserved.
//

#import "AppDelegate.h"
#import <ErrorTracking/ErrorTracking.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    NSLog(@"🍎🍎🍎🍎🍎%@", NSHomeDirectory());

    ErrorTrackingConfig *config = [[ErrorTrackingConfig alloc]init];
    config.logLevel = WTLogLevelWarn;
    config.trackStep = YES;
    [ErrorTracking installWithAppID:@"555adcbfdbb9784b1083559dfc44ee8e848aea8d" config:config];
    WTLOG_VERBOSE(@"💜");
    WTLOG_DEBUG(@"💚");
    WTLOG_INFO(@"💙");
    WTLOG_WARN(@"💛");
    WTLOG_ERROR(@"❤️");


    NSException *exception = [NSException exceptionWithName:@"testException2" reason:@"testReason2" userInfo:@{@"exceptionKey": @"exceptionValue"}];
    [ErrorTracking reportException:exception fingerPrint:@"finger"];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
