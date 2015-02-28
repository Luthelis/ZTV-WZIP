//
//  WZIPMediaWebViewController.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 2/27/15.
//  Copyright (c) 2015 University of Akron. All rights reserved.
//

#import "WZIPMediaWebViewController.h"

@interface WZIPMediaWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *wzipWebView;

@end

@implementation WZIPMediaWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:self.wzipWebURL];
    [self.wzipWebView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dismissWebView:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)nextButton:(id)sender
{
    [self.wzipWebView goForward];
}
- (IBAction)previousButton:(id)sender
{
    [self.wzipWebView goBack];
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
