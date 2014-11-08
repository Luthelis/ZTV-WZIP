//
//  Instagram+Photos.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/6/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

#import "Instagram+Photos.h"

@implementation Instagram (Photos)

+ (Instagram *)photoWithInstagramData:(NSDictionary *)instagramData
               inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSDictionary *instagramDataDictionary = [[NSDictionary alloc] initWithDictionary:[instagramData objectForKey:@"data"]];
    NSDictionary *thumbnailDictionary = [[NSDictionary alloc] initWithDictionary:[instagramDataDictionary objectForKey:@"thumbnail"]];
    NSURL *thumbnailURL = [thumbnailDictionary objectForKey:@"url"];
    //self.thumbPhotoURL = thumbnailURL;
    Instagram *photo = [NSEntityDescription insertNewObjectForEntityForName:@"Instagram" inManagedObjectContext:context];
    photo.thumbPhotoURL = [NSString stringWithFormat:@"%@", thumbnailURL];
    NSData *photoData = [NSData dataWithContentsOfURL:thumbnailURL];
    photo.thumbPhoto = photoData;
    return photo;
}



@end
