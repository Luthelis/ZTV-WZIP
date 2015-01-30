//
//  Instagram+Photos.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/6/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

#import "Instagram+Photos.h"

@implementation Instagram (Photos)
/*
+ (Instagram *)photoWithInstagramData:(NSDictionary *)instagramData
                   withFullSizeImages:(NSArray *)images
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

+ (void)instagramImage:(NSDictionary *)thumbnailData
     withFullSizeImage:(NSArray *)images
           takenOnDate:(NSArray *)date
 withSessionIdentifier:(NSString *)identifier
inManagedObjectContext:(NSManagedObjectContext *)context
{
    for (NSString *caption in thumbnailData.allKeys)
    {
        Instagram *photo = [NSEntityDescription insertNewObjectForEntityForName:@"Instagram" inManagedObjectContext:context];
        photo.photoDescription = caption;
        for (NSString *url in thumbnailData.allValues)
        {
            photo.thumbPhotoURL = url;
            NSData *thumbData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
            photo.thumbPhoto = thumbData;
        }
        for (NSString *url in images)
        {
            photo.photoURL = url;
            NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
            photo.photo = imageData;
        }
        for (NSDate *instaDate in date) {
            photo.date = instaDate;
        }
        photo.account = identifier;
        
    }
}*/

+ (Instagram *)instagramImage:(NSDictionary *)imageData
inManagedObjectContext:(NSManagedObjectContext *)context
{
    Instagram *photo = [NSEntityDescription insertNewObjectForEntityForName:@"Instagram" inManagedObjectContext:context];
    photo.photoDescription = [imageData objectForKey:@"caption"];
    photo.date = [imageData objectForKey:@"date"];
    photo.thumbPhotoURL = [imageData objectForKey:@"thumbURL"];
    NSData *thumbPhotoInfo = [NSData dataWithContentsOfURL:[NSURL URLWithString:[imageData objectForKey:@"thumbURL"]]];
    photo.thumbPhoto = thumbPhotoInfo;
    photo.photoURL = [imageData objectForKey:@"fullURL"];
    NSData *fullPhoto = [NSData dataWithContentsOfURL:[NSURL URLWithString:[imageData objectForKey:@"fullURL"]]];
    photo.photo = fullPhoto;
    return photo;
}


@end
