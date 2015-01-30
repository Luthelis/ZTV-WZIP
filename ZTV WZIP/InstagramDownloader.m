//
//  InstagramDownloader.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/6/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

#import "InstagramDownloader.h"
#import "Instagram+Photos.h"

@interface InstagramDownloader ()

@end

@implementation InstagramDownloader

- (NSMutableArray *)imageData
{
    if (!_imageData)
    {
        _imageData = [[NSMutableArray alloc] init];
    }
    return _imageData;
}

- (void)beginBackgroundDownload:(NSURLRequest *)request
           withSessionIdentifer:(NSString *)identifier
{
    NSOperationQueue *sessionQueue = [[NSOperationQueue alloc] init];
    sessionQueue.qualityOfService = NSOperationQualityOfServiceBackground;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:sessionQueue];
    session.sessionDescription = identifier;
    NSURLSessionDownloadTask *instagramDownloadSession = [session downloadTaskWithRequest:request];
    [instagramDownloadSession resume];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *fileName = downloadTask.response.suggestedFilename;
    NSURL *homeURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    homeURL = [homeURL URLByAppendingPathComponent:fileName];
    NSError *error;
    [fileManager moveItemAtPath:[location path] toPath:[homeURL path] error:&error];
    NSData *infoData = [[NSData alloc] initWithContentsOfFile:[homeURL path]];
    NSDictionary *infoDictionary = [NSDictionary dictionaryWithObject:infoData forKey:@"data"];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:@"Download Complete" object:self userInfo:infoDictionary];

}

- (void)startImageDownload:(NSArray *)dataArray
{
    NSString *url;
    for (url in dataArray) {
        NSURL *URLToDownload = [NSURL URLWithString:url];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:URLToDownload];
        NSURLSession *imageSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        NSURLSessionDataTask *imageSessionData = [imageSession dataTaskWithRequest:urlRequest];
        [imageSessionData resume];
    }
}

- (void)jsonParser:(NSArray *)information forFetchedResultsController:(NSFetchedResultsController *)controller;

{
    NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];
    NSBlockOperation *parseOperation = [NSBlockOperation blockOperationWithBlock:^{
    for (NSDictionary *instagramData in information)
    {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        NSDictionary *caption = [instagramData objectForKey:@"caption"];
        NSNumber *identifier = [formatter numberFromString:[caption objectForKey:@"id"]];
        NSString *captionText = [caption objectForKey:@"text"];
        NSNumber *dateObject = [formatter numberFromString:[caption objectForKey:@"created_time"]];
        NSDate *imageDate = [NSDate dateWithTimeIntervalSince1970:[dateObject doubleValue]];
        NSDictionary *imageDictionary = [NSDictionary dictionaryWithDictionary:[instagramData objectForKey:@"images"]];
        NSDictionary *thumbDictionary = [NSDictionary dictionaryWithDictionary:[imageDictionary objectForKey:@"thumbnail"]];
        NSString *thumbURL = [thumbDictionary objectForKey:@"url"];
        NSDictionary *fullImageDictionary = [NSDictionary dictionaryWithDictionary:[imageDictionary objectForKey:@"standard_resolution"]];
        NSString *fullURL = [fullImageDictionary objectForKey:@"url"];
        NSError *error;
        [controller performFetch:&error];
        for (Instagram *instagram in [controller fetchedObjects]) {
            NSNumber *instagramID = instagram.idNumber;
            if (instagramID == identifier) {
                
            }
        }
        NSArray *keyArray = [[NSArray alloc] initWithObjects:@"id", @"caption", @"date", @"thumbURL", @"fullURL", nil];
        NSArray *objectArray = [[NSArray alloc] initWithObjects:identifier, captionText, imageDate, thumbURL, fullURL, nil];
        NSDictionary *instagramDictionary = [NSDictionary dictionaryWithObjects:objectArray forKeys:keyArray];
        Instagram *photo = [Instagram instagramImage:instagramDictionary inManagedObjectContext:self.context];
        if (photo) NSLog(@"Object Created");
        }

    }];
    [backgroundQueue addOperation:parseOperation];
    }

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{

    /*NSError *error;
    NSDictionary *infoData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (!error)
    {
        NSDictionary *instaData = [NSDictionary dictionaryWithDictionary:[infoData objectForKey:@"data"]];
        NSArray *instaKeys = instaData.allKeys;
        NSMutableArray *mutableCaptionArray = [[NSMutableArray alloc] init];
        NSMutableArray *mutableThumbnailArray = [[NSMutableArray alloc] init];
        NSMutableArray *mutableImageArray = [[NSMutableArray alloc] init];
        NSMutableArray *mutableDateArray = [[NSMutableArray alloc] init];
        for (NSString *keys in instaKeys)
        {
            if ([keys isEqualToString:@"caption"])
            {
                NSDictionary *captionDictionary = [NSDictionary dictionaryWithDictionary:[instaData objectForKey:@"caption"]];
                NSString *captionText = [captionDictionary objectForKey:@"text"];
                [mutableCaptionArray addObject:captionText];
                NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
                NSNumber *instaDate = [formatter numberFromString:[instaData objectForKey:@"created_time"]];
                NSDate *photoDate = [NSDate dateWithTimeIntervalSince1970:[instaDate doubleValue]];
                [mutableDateArray addObject:photoDate];
            }
            NSArray *captionArray = [mutableCaptionArray copy];
            if ([keys isEqualToString:@"images"])
            {
                NSDictionary *imageDictionary = [NSDictionary dictionaryWithDictionary:[instaData objectForKey:@"images"]];
                NSDictionary *thumbnailDictionary = [NSDictionary dictionaryWithDictionary:[imageDictionary objectForKey:@"thumbnail"]];
                NSDictionary *fullSizeImageDictionary = [NSDictionary dictionaryWithDictionary:[imageDictionary objectForKey:@"standard_resolution"]];
                [mutableThumbnailArray addObject:[thumbnailDictionary objectForKey:@"url"]];
                [mutableImageArray addObject:[fullSizeImageDictionary objectForKey:@"url"]];
            }
            NSArray *thumbnailArray = [mutableThumbnailArray copy];
            NSArray *imageArray = [mutableImageArray copy];
            NSArray *dateArray = [mutableDateArray copy];
            NSDictionary *images = [NSDictionary dictionaryWithObjects:thumbnailArray forKeys:captionArray];
            //[Instagram instagramImage:images withFullSizeImage:imageArray takenOnDate:dateArray withSessionIdentifier:session.sessionDescription inManagedObjectContext:self.context];
        }
    }
*/     
}



@end
