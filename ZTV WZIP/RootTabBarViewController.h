//
//  RootTabBarViewController.h
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/24/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreData;

@interface RootTabBarViewController : UITabBarController

@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSFetchedResultsController *fetchController;

@end
