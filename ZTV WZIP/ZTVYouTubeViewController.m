//
//  ZTVYouTubeViewController.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/5/14.
//  Copyright (c) 2014 Timothy Transue. All rights reserved.
//

#import "ZTVYouTubeViewController.h"
#import "PrimaryTabBarController.h"
@import AVFoundation;
@import SafariServices;

@interface ZTVYouTubeViewController () <SFSafariViewControllerDelegate, UIWebViewDelegate>
@property (strong, nonatomic) NSMutableArray *URLArray;
@property (weak, nonatomic) IBOutlet UIWebView *youTubeView;
@end

@implementation ZTVYouTubeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.youTubeView.delegate = self;
    // Do any additional setup after loading the view.
    // Sets the web view to the proper YouTube page
    SFSafariViewController *safariYouTubeController = [[SFSafariViewController alloc] initWithURL:self.youtubeURL];
    safariYouTubeController.delegate = self;
    [self presentViewController:safariYouTubeController animated:YES completion:^{
        
    }];
    AVAudioSession *wzip = [AVAudioSession sharedInstance];
    [wzip setCategory:AVAudioSessionCategoryPlayback error:nil];
    [wzip setActive:YES withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
    [self becomeFirstResponder];
    [(PrimaryTabBarController*) [self tabBarController] setLandscapeOK:YES];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)closeWindow:(UIBarButtonItem *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark WebView Delegate Information

- (IBAction)backButton:(UIBarButtonItem *)sender
{
    [self.youTubeView goBack];
}

- (IBAction)forwardButton:(UIBarButtonItem *)sender
{
    [self.youTubeView goForward];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self resignFirstResponder];
}
@end
