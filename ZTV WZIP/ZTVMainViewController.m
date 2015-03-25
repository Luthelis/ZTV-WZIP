//
//  ZTVMainViewController.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 3/24/15.
//  Copyright (c) 2015 University of Akron. All rights reserved.
//

#import "ZTVMainViewController.h"
#import "PrimaryTabBarController.h"

@interface ZTVMainViewController ()

@end

@implementation ZTVMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [(PrimaryTabBarController*) [self tabBarController] setLandscapeOK:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
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
