//
//  FacebookViewController.h
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/3/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Accounts;

@interface FacebookViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *facebookWebView;
@property (strong, nonatomic) NSURL *socialURL;

@end
