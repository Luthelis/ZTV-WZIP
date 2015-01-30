//
//  RootTabBarViewController.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/24/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

#import "RootTabBarViewController.h"


@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setManagedObjectContext:) name:@"Context Ready" object:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setManagedObjectContext:(NSNotification *)notification
{
    self.context = [notification.userInfo objectForKey:@"Context"];
    NSLog(@"Context in Tab Bar Controller");
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
