//
//  ZTVShowsTableViewController.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/5/14.
//  Copyright (c) 2014 Timothy Transue. All rights reserved.
//

#import "ZTVShowsTableViewController.h"
@import SafariServices;

@interface ZTVShowsTableViewController () <SFSafariViewControllerDelegate>

@end

@implementation ZTVShowsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
// Section is commented out due to using static cells
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 5;
}
*/
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
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
- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSURL *youtubeURL;
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    youtubeURL = [NSURL URLWithString:@"https://www.youtube.com/user/ZTVAkronAfterHours"];
                    break;
                case 1:
                    youtubeURL = [NSURL URLWithString:@"https://www.youtube.com/user/ZTVLCA"];
                    break;
                case 2:
                    youtubeURL = [NSURL URLWithString:@"https://www.youtube.com/user/ZTVsports"];
                    break;
                case 3:
                    youtubeURL = [NSURL URLWithString:@"https://www.youtube.com/user/ztvgoofingoff"];
                    break;
                case 4:
                    youtubeURL = [NSURL URLWithString:@"https://www.youtube.com/user/ztvlowdown"];
                    break;
                case 5:
                    youtubeURL = [NSURL URLWithString:@"https://www.youtube.com/channel/UCi04rIb5XAL0pAjDTXKDzCA"];
                    break;
                case 6:
                    youtubeURL = [NSURL URLWithString:@"https://www.youtube.com/channel/UCHxkqHJCd9to7lxFQlQpPeQ"];
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    youtubeURL = [NSURL URLWithString:@"https://m.youtube.com/channel/UCPHbqRYdXcPFA9BocjQPusw"];
                    break;
                case 1:
                    youtubeURL = [NSURL URLWithString:@"https://m.youtube.com/channel/UCzAPLA1iIWVkqaoEN2FbRJg"];
                    break;
                default:
                    break;
            }
        default:
            break;
    }
    [self instantiateSafariViewController:youtubeURL];
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
