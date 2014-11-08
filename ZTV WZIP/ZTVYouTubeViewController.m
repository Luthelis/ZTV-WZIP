//
//  ZTVYouTubeViewController.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/5/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

#import "ZTVYouTubeViewController.h"

@interface ZTVYouTubeViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *youtubeWebView;

@end

@implementation ZTVYouTubeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.youtubeWebView loadRequest:self.youtubeURLRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
