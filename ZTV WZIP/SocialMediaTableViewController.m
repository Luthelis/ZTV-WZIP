//
//  SocialMediaTableViewController.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/3/14.
//  Copyright (c) 2014 Timothy Transue. All rights reserved.
//
#import "SocialMediaTableViewController.h"
#import "PrimaryTabBarController.h"
@import SafariServices;

@interface SocialMediaTableViewController () <SFSafariViewControllerDelegate>

@end

@implementation SocialMediaTableViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    // This is not necessary in this version
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [(PrimaryTabBarController*) [self tabBarController] setLandscapeOK:NO];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //self.tabBarController.tabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}
 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 7;
}
*/

- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSURL *socialMediaURL;
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            socialMediaURL = [NSURL URLWithString:@"http://www.facebook.com/wzipfm"];
        }
        else if (indexPath.row == 1)
        {
            socialMediaURL = [NSURL URLWithString:@"https://twitter.com/WZIP"];
        }
        else if (indexPath.row == 2)
        {
            socialMediaURL = [NSURL URLWithString:@"http://www.facebook.com/ZTVAkron"];
        }
        else if (indexPath.row == 3)
        {
            socialMediaURL = [NSURL URLWithString:@"https://twitter.com/ZTVAkron"];
        }
        else if (indexPath.row == 4)
        {
            socialMediaURL = [NSURL URLWithString:@"https://www.facebook.com/akronafterhours"];
        }
        else if (indexPath.row == 5)
        {
            socialMediaURL = [NSURL URLWithString:@"https://twitter.com/akronafterhours"];
        }
        else if (indexPath.row == 6)
        {
            socialMediaURL = [NSURL URLWithString:@"https://www.facebook.com/ztvLCA"];
        }
        else if (indexPath.row == 7)
        {
            socialMediaURL = [NSURL URLWithString:@"https://twitter.com/ztvlca"];
        }
        else if (indexPath.row == 8)
        {
            socialMediaURL = [NSURL URLWithString:@"https://www.facebook.com/TheZTVSportsReport"];
        }
        else if (indexPath.row == 9)
        {
            socialMediaURL = [NSURL URLWithString:@"https://twitter.com/ztvsports"];
        }
        else if (indexPath.row == 10)
        {
            socialMediaURL = [NSURL URLWithString:@"https://www.facebook.com/GoofingOff"];
        }
        else if (indexPath.row == 11)
        {
            socialMediaURL = [NSURL URLWithString:@"https://twitter.com/ztvgoofingoff"];
        }
        else if (indexPath.row == 12)
        {
            socialMediaURL = [NSURL URLWithString:@"https://www.facebook.com/ZTVLowdown"];
        }
        else if (indexPath.row == 13)
        {
            socialMediaURL = [NSURL URLWithString:@"https://twitter.com/ztvlowdown"];
        }
        else if (indexPath.row == 14)
        {
            socialMediaURL = [NSURL URLWithString:@"https://www.facebook.com/ztvundergradz"];
        }
        else if (indexPath.row == 15)
        {
            socialMediaURL = [NSURL URLWithString:@"https://twitter.com/ztvundergradz"];
        }
        else if (indexPath.row == 16)
        {
            socialMediaURL = [NSURL URLWithString:@"https://www.facebook.com/pages/ZTVs-300-Seconds-of-Science/1420366161604098?fref=ts"];
        }
        else if (indexPath.row == 17)
        {
            socialMediaURL = [NSURL URLWithString:@"https://twitter.com/300SecOfScience"];
        }
        else if (indexPath.row == 18)
        {
            socialMediaURL = [NSURL URLWithString:@"https://www.facebook.com/SportsPowerTalk"];
        }
        else if (indexPath.row == 19)
        {
            socialMediaURL = [NSURL URLWithString:@"https://twitter.com/SportsPowerTalk"];
        }
    }
    [self instantiateSafariViewController:socialMediaURL];
}

- (void)instantiateSafariViewController:(nonnull NSURL *)URL
{
    SFSafariViewController *safariViewController = [[SFSafariViewController alloc] initWithURL:URL];
    safariViewController.delegate = self;
    [self presentViewController:safariViewController animated:YES completion:nil];
}

- (void)safariViewControllerDidFinish:(nonnull SFSafariViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation
/*
// This code has been replaced with the SFSafariViewController code listed in tableView:didSelectRowAtIndexPath:
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)dealloc
{
}


@end
