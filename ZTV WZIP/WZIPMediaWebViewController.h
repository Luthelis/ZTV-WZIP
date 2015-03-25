//
//  WZIPMediaWebViewController.h
//  ZTV WZIP
//
//  Created by Timothy Transue on 2/27/15.
//  Copyright (c) 2015 University of Akron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZIPMediaWebViewController : UIViewController

/* 
    Precondition
    With the properly passed URL, this method will load a website using the URL
*/
@property (strong, nonatomic) NSURL *wzipWebURL;

@end
