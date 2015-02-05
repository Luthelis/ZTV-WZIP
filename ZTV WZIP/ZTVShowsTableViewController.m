//
//  ZTVShowsTableViewController.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/5/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

#import "ZTVShowsTableViewController.h"
#import "ZTVYouTubeViewController.h"

@interface ZTVShowsTableViewController ()

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue destinationViewController] isKindOfClass:[ZTVYouTubeViewController class]])
         {
             ZTVYouTubeViewController *destination = [segue destinationViewController];
             NSURL *youtubeURL;
             if ([segue.identifier isEqualToString:@"akronAfterHours"])
             {
                 youtubeURL = [NSURL URLWithString:@"https://m.youtube.com/user/ZTVAkronAfterHours"];
             }
             else if ([segue.identifier isEqualToString:@"goofingOff"])
             {
                 youtubeURL = [NSURL URLWithString:@"https://m.youtube.com/user/ztvgoofingoff"];
             }
             else if ([segue.identifier isEqualToString:@"lightsCameraAkron"])
             {
                 youtubeURL = [NSURL URLWithString:@"https://m.youtube.com/user/ZTVLCA"];
             }
             else if ([segue.identifier isEqualToString:@"sportsReport"])
             {
                 youtubeURL = [NSURL URLWithString:@"https://m.youtube.com/user/ZTVsports"];
             }
             else if ([segue.identifier isEqualToString:@"lowdown"])
             {
                 youtubeURL = [NSURL URLWithString:@"https://m.youtube.com/user/ztvlowdown"];
             }
             else if ([segue.identifier isEqualToString:@"soChic"])
             {
                 youtubeURL = [NSURL URLWithString:@"https://m.youtube.com/channel/UCzAPLA1iIWVkqaoEN2FbRJg"];
             }
             else if ([segue.identifier isEqualToString:@"theFeed"])
             {
                 youtubeURL = [NSURL URLWithString:@"https://m.youtube.com/channel/UCPHbqRYdXcPFA9BocjQPusw"];
             }
             else if ([segue.identifier isEqualToString:@"undergradz"])
             {
                 youtubeURL = [NSURL URLWithString:@"https://www.youtube.com/channel/UCi04rIb5XAL0pAjDTXKDzCA"];
             }
             else youtubeURL = nil;
             NSURLRequest *youtubeRequest = [NSURLRequest requestWithURL:youtubeURL];
             destination.youtubeURLRequest = youtubeRequest;
         }
}


@end
