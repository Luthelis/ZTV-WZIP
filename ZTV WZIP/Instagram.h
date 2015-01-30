//
//  Instagram.h
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/25/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Instagram : NSManagedObject

@property (nonatomic, retain) NSString * account;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) NSString * photoDescription;
@property (nonatomic, retain) NSString * photoURL;
@property (nonatomic, retain) NSData * thumbPhoto;
@property (nonatomic, retain) NSString * thumbPhotoURL;
@property (nonatomic, retain) NSNumber * idNumber;

@end
