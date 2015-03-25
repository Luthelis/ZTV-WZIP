//
//  FacebookViewController.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/3/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

#import "FacebookViewController.h"
#import "PrimaryTabBarController.h"

@interface FacebookViewController ()

@end

@implementation FacebookViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // The next two lines load the social media URL provided by the previous view controller
    NSMutableURLRequest *socialRequest = [NSMutableURLRequest requestWithURL:self.socialURL];
        [self.facebookWebView loadRequest:socialRequest];
    [(PrimaryTabBarController*) [self tabBarController] setLandscapeOK:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(UIBarButtonItem *)sender
{
    [self.facebookWebView goBack];
}

- (IBAction)forwardButton:(id)sender
{
    [self.facebookWebView goForward];
}
- (IBAction)closeButton:(UIBarButtonItem *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
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
