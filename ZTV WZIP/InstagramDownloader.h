//
//  InstagramDownloader.h
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/6/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

@import CoreData;
#import <Foundation/Foundation.h>

@interface InstagramDownloader : NSObject <NSURLSessionDelegate, NSURLSessionDownloadDelegate, NSURLSessionDataDelegate>

@property (nonatomic, strong) NSMutableArray *imageData;
@property (nonatomic, strong) NSManagedObjectContext *context;

- (void)beginBackgroundDownload:(NSURLRequest *)request withSessionIdentifer:(NSString *)identifier;
- (void)startImageDownload:(NSArray *)dataArray;
- (void)jsonParser:(NSArray *)information forFetchedResultsController:(NSFetchedResultsController *)controller;

@end
