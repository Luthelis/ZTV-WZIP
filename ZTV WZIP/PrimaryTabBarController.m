//
//  PrimaryTabBarController.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 3/24/15.
//  Copyright (c) 2015 University of Akron. All rights reserved.
//

#import "PrimaryTabBarController.h"

@interface PrimaryTabBarController ()

@end

@implementation PrimaryTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if (self.landscapeOK) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    else return UIInterfaceOrientationMaskPortrait;
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
