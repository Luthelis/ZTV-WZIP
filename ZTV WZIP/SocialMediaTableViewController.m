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

@property (nonatomic, strong) NSManagedObjectContext *context;

@end

@implementation SocialMediaTableViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    // This is not necessary in this version
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(provideManagedObjectContext:) name:@"Context" object:nil];
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

- (void)provideManagedObjectContext:(NSNotification *)notification
{
    // This method is not used in this version.  Also related to the Managed Object Context
    self.context = [notification.userInfo objectForKey:@"Context"];
    NSLog(@"Context provided");
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
    NSURL *socialURL;
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    socialURL = [NSURL URLWithString:@"http://www.facebook.com/wzipfm"];
                    break;
                case 1:
                    socialURL = [NSURL URLWithString:@"https://twitter.com/WZIP"];
                    break;
                case 2:
                    socialURL = [NSURL URLWithString:@"http://www.facebook.com/ZTVAkron"];
                    break;
                case 3:
                    socialURL = [NSURL URLWithString:@"https://twitter.com/ZTVAkron"];
                    break;
                case 4:
                    socialURL = [NSURL URLWithString:@"https://www.facebook.com/akronafterhours"];
                    break;
                case 5:
                    socialURL = [NSURL URLWithString:@"https://twitter.com/akronafterhours"];
                    break;
                case 6:
                    socialURL = [NSURL URLWithString:@"https://www.facebook.com/ztvLCA"];
                    break;
                case 7:
                    socialURL = [NSURL URLWithString:@"https://twitter.com/ztvlca"];
                    break;
                case 8:
                    socialURL = [NSURL URLWithString:@"https://www.facebook.com/TheZTVSportsReport"];
                    break;
                case 9:
                    socialURL = [NSURL URLWithString:@"https://twitter.com/ztvsports"];
                    break;
                case 10:
                    socialURL = [NSURL URLWithString:@"https://www.facebook.com/GoofingOff"];
                    break;
                case 11:
                    socialURL = [NSURL URLWithString:@"https://twitter.com/ztvgoofingoff"];
                    break;
                case 12:
                    socialURL = [NSURL URLWithString:@"https://www.facebook.com/ZTVLowdown"];
                    break;
                case 13:
                    socialURL = [NSURL URLWithString:@"https://twitter.com/ztvlowdown"];
                    break;
                case 14:
                    socialURL = [NSURL URLWithString:@"https://www.facebook.com/ztvundergradz"];
                    break;
                case 15:
                    socialURL = [NSURL URLWithString:@"https://twitter.com/ztvundergradz"];
                    break;
                case 16:
                    socialURL = [NSURL URLWithString:@"https://www.facebook.com/pages/ZTVs-300-Seconds-of-Science/1420366161604098?fref=ts"];
                    break;
                case 17:
                    socialURL = [NSURL URLWithString:@"https://twitter.com/300SecOfScience"];
                    break;
                case 18:
                    socialURL = [NSURL URLWithString:@"https://www.facebook.com/SportsPowerTalk"];
                    break;
                case 19:
                    socialURL = [NSURL URLWithString:@"https://twitter.com/SportsPowerTalk"];
                    break;
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    [self instantiateSafariViewController:socialURL];
}
- (void)instantiateSafariViewController:(nonnull NSURL *)URL
{
    SFSafariViewController *safariViewController = [[SFSafariViewController alloc] initWithURL:URL];
    safariViewController.delegate = self;
    [self presentViewController:safariViewController animated:YES completion:nil];
}
- (void)safariViewControllerDidFinish:(nonnull SFSafariViewController *)controller
{
    // [self dismissViewControllerAnimated:YES completion:nil]; Unnecessary as of iOS 9.0 Beta 5.  Uncomment if view controller fails to dismiss
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (void)dealloc
{
    // The following line is necessary to remove the view controller from the notification center.  Will break without this line involved.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
