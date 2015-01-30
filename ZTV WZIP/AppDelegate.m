//
//  AppDelegate.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/3/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

#import "AppDelegate.h"
#import "Instagram+Photos.h"
#import "RootTabBarViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self instagramPhotoDatabase];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    
}

- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)())completionHandler
{
    
}

- (BOOL)instagramPhotoDatabase
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsDirectory = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *documentName = @"InstagramDatabase";
    NSURL *documentURL = [documentsDirectory URLByAppendingPathComponent:documentName];
    UIManagedDocument *instagram = [[UIManagedDocument alloc] initWithFileURL:documentURL];
    if ([fileManager fileExistsAtPath:[documentURL path]])
    {
        [instagram openWithCompletionHandler:^(BOOL success) {
            //if (success) [self startInstagramDownload:instagram];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:instagram.managedObjectContext forKey:@"Context"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"Context Ready" object:self userInfo:userInfo];
            NSLog(@"Context Posted");
        }];
    }
    else if (![fileManager fileExistsAtPath:[documentURL path]])
    {
        [instagram saveToURL:instagram.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success)
        {
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:instagram.managedObjectContext forKey:@"Context"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"Context Ready" object:self userInfo:userInfo];
            NSLog(@"Context Posted");
        }];
    }
    return YES;
}

/*
 - (void)startInstagramDownload:(UIManagedDocument *)document
{
    if (document.documentState == UIDocumentStateNormal)
    {
        self.context = document.managedObjectContext;
        NSDictionary *wzipInstagramDictionary = [[NSDictionary alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://api.instagram.com/v1/users/V/media/recent/?client_id=a5c7afd7cde04beeab556fd6e57dc666"]];
        NSDictionary *ztvInstagramDictionary = [[NSDictionary alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://api.instagram.com/v1/users/225178844/media/recent/?client_id=a5c7afd7cde04beeab556fd6e57dc666"]];
        [Instagram photoWithInstagramData:wzipInstagramDictionary inManagedObjectContext:self.context];
        [Instagram photoWithInstagramData:ztvInstagramDictionary inManagedObjectContext:self.context];
        
    }
    else if (document.documentState == UIDocumentStateClosed)
    {
        [document openWithCompletionHandler:^(BOOL success) {
            if (success)
            {
                self.context = document.managedObjectContext;
            }
        }];
    }
}
*/
    
@end
