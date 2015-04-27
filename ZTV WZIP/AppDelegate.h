//
//  AppDelegate.h
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/3/14.
//  Copyright (c) 2014 Timothy Transue. All rights reserved.
//

@import UIKit;
@import Foundation;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSManagedObjectContext *context;  //Managed Object Context to be used in later versions

@end

