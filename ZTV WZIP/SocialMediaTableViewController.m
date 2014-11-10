//
//  SocialMediaTableViewController.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/3/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

#import "SocialMediaTableViewController.h"
#import "FacebookViewController.h"

@interface SocialMediaTableViewController ()

@end

@implementation SocialMediaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 2;
}

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
    NSURL *socialURL;
    if ([[segue destinationViewController] isKindOfClass:[FacebookViewController class]])
    {
        FacebookViewController *destination = [segue destinationViewController];
        if ([segue.identifier isEqualToString:@"ztvFacebook"])
        {
            socialURL = [NSURL URLWithString:@"http://www.facebook.com/ZTVAkron"];
            destination.socialURL = socialURL;
            destination.title = @"ZTV Facebook";
        }
        else if ([segue.identifier isEqualToString:@"ztvTwitter"])
        {
            socialURL = [NSURL URLWithString:@"https://twitter.com/ZTVAkron"];
            destination.socialURL = socialURL;
            destination.title = @"ZTV Twitter";
        }
        else if ([segue.identifier isEqualToString:@"wzipFacebook"])
        {
            socialURL = [NSURL URLWithString:@"http://www.facebook.com/wzipfm"];
            destination.socialURL = socialURL;
            destination.title = @"WZIP Facebook";
        }
        else if ([segue.identifier isEqualToString:@"wzipTwitter"])
        {
            socialURL = [NSURL URLWithString:@"https://twitter.com/WZIP"];
            destination.socialURL = socialURL;
            destination.title = @"WZIP Twitter";

        }
    }
}


@end
