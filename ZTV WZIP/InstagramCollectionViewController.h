//
//  InstagramCollectionViewController.h
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/6/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

@import CoreData;
#import <UIKit/UIKit.h>
@import CoreGraphics;

@interface InstagramCollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSString *stationName;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSURL *stationURL;

@end
