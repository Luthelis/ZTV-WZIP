//
//  SocialMainViewController.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 4/29/15.
//  Copyright (c) 2015 Timothy Transue. All rights reserved.
//

#import "SocialMainViewController.h"
@import QuartzCore;

@interface SocialMainViewController ()

@end

@implementation SocialMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CAGradientLayer *gradient = [[CAGradientLayer alloc] initWithLayer:self.view.layer];
    NSArray *colorArray = @[[UIColor blueColor], [UIColor yellowColor]];
    gradient.colors = colorArray;
    gradient.startPoint = self.view.frame.origin;
    UIViewController *childController = [self.childViewControllers lastObject];
    UIView *childView = childController.view;
    CGPoint gradientEndPoint = CGPointMake(childView.center.x * 2, childView.frame.origin.y);
    gradient.endPoint = gradientEndPoint;
    
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
