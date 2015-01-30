//
//  Instagram+Photos.h
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/6/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

#import "Instagram.h"
@import UIKit;

@interface Instagram (Photos)
/*
+ (Instagram *)photoWithInstagramData:(NSDictionary *)instagramData
                   withFullSizeImages:(NSArray *)images
               inManagedObjectContext:(NSManagedObjectContext *)context;

+ (void)instagramImage:(NSDictionary *)thumbnailData
     withFullSizeImage:(NSArray *)images
           takenOnDate:(NSArray *)date
 withSessionIdentifier:(NSString *)identifier
inManagedObjectContext:(NSManagedObjectContext *)context;
*/

+ (Instagram *)instagramImage:(NSDictionary *)imageData
inManagedObjectContext:(NSManagedObjectContext *)context;

@end
