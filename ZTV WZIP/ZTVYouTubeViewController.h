//
//  ZTVYouTubeViewController.h
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/5/14.
//  Copyright (c) 2014 Timothy Transue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTVYouTubeViewController : UIViewController

// Gets the URL Request from it's previous controller
@property (strong, nonatomic) NSURL *youtubeURL;
@property (weak, nonatomic) IBOutlet UINavigationBar *titleBar;

@end
