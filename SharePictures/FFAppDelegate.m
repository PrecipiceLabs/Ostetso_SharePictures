//
//  FFAppDelegate.m
// 
//
//  Copyright (c) 2015 Precipice Labs, Inc. All rights reserved.
//


#import "FFAppDelegate.h"
#import "Reachability.h"
#import "FFViewController.h"
#import "Ostetso/Ostetso.h"
#import "HomeViewController.h"
@implementation FFAppDelegate

@synthesize window;
@synthesize viewController;

#import "OstetsoConfig.h"

void uncaughtExceptionHandler(NSException *exception)
{
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];  // Hide the status bar
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        self.viewController = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    }
    else
    {
        self.viewController = [[HomeViewController alloc] initWithNibName:@"HomeViewController_iPad" bundle:nil];
    }
    
    [Ostetso setApplicationID:OSTETSO_APP_ID
                       appKey:OSTETSO_API_KEY
     useProductionEnvironment:USE_PRODUCTION_SERVER
                     delegate:self.viewController];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    nav.navigationBar.barStyle = UIBarStyleBlackTranslucent; //UIBarStyleBlack;

    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];

    self.window.tintColor = [UIColor whiteColor];
    
    [Ostetso applicationDidFinishLaunchingWithOptions: launchOptions];
    
    return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)applicationWillResignActive:(UIApplication *)application
{
   // [viewController setCameraCaptureState: NO];
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    //  [[NSNotificationCenter defaultCenter] postNotificationName:@"ApplicationDidEnterBackground" object:self];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  //  [viewController setCameraCaptureState: YES];
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
   // [viewController setCameraCaptureState: YES];
}


- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    NSLog(@"applicationDidReceiveMemoryWarning");
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


#pragma mark Ostetso

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////// Ostetso Stuff
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [Ostetso handleURL: url];
}

#pragma mark Push notifications


- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)pushToken
{
    [Ostetso registerPushToken: pushToken];
}


- (void)application:(UIApplication*)application didReceiveRemoteNotification:(NSDictionary*)userInfo
{
    [Ostetso didReceiveRemoteNotification: userInfo];
}


- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
#if !TARGET_IPHONE_SIMULATOR
    NSLog(@"Failed to get push token, with error: %@", error);
#endif
}


@end
