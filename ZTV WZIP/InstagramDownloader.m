//
//  InstagramDownloader.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/6/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

#import "InstagramDownloader.h"

@implementation InstagramDownloader

- (void)beginBackgroundDownload
{
    dispatch_queue_t queue = dispatch_queue_create("edu.uofakron.ztv-wzip", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        
    });
}

@end
