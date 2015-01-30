//
//  SocialMediaTableViewController.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/3/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//
@import CoreData;
#import "SocialMediaTableViewController.h"
#import "FacebookViewController.h"

@interface SocialMediaTableViewController ()

@property (nonatomic, strong) NSManagedObjectContext *context;

@end

@implementation SocialMediaTableViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(provideManagedObjectContext:) name:@"Context" object:nil];
}

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

- (void)provideManagedObjectContext:(NSNotification *)notification
{
    self.context = [notification.userInfo objectForKey:@"Context"];
    NSLog(@"Context provided");
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
    return 9;
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
        else if ([segue.identifier isEqualToString:@"aahFacebook"])
        {
            socialURL = [NSURL URLWithString:@"https://www.facebook.com/akronafterhours"];
            destination.socialURL = socialURL;
            destination.title = @"Akron After Hours";
        }
        else if ([segue.identifier isEqualToString:@"aahTwitter"])
        {
            socialURL = [NSURL URLWithString:@"https://twitter.com/akronaferhours"];
            destination.socialURL = socialURL;
            destination.title = @"Akron After Hours";
        }
        else if ([segue.identifier isEqualToString:@"goofFacebook"])
        {
            socialURL = [NSURL URLWithString:@"https://www.facebook.com/GoofingOff"];
            destination.socialURL = socialURL;
            destination.title = @"Goofing Off!";
        }
        else if ([segue.identifier isEqualToString:@"goofTwitter"])
        {
            socialURL = [NSURL URLWithString:@"https://twitter.com/ztvgoofingoff"];
            destination.socialURL = socialURL;
            destination.title = @"Goofing Off!";
        }
        else if ([segue.identifier isEqualToString:@"lcaFacebook"])
        {
            socialURL = [NSURL URLWithString:@"https://www.facebook.com/ztvLCA"];
            destination.socialURL = socialURL;
            destination.title = @"Lights, Camera, Akron!";
        }
        else if ([segue.identifier isEqualToString:@"lcaTwitter"])
        {
            socialURL = [NSURL URLWithString:@"https://twitter.com/ztvlca"];
            destination.socialURL = socialURL;
            destination.title = @"Lights, Camera, Akron!";
        }
        else if ([segue.identifier isEqualToString:@"sportsFacebook"])
        {
            socialURL = [NSURL URLWithString:@"https://www.facebook.com/TheZTVSportsReport"];
            destination.socialURL = socialURL;
            destination.title = @"Sports Report";
        }
        else if ([segue.identifier isEqualToString:@"sportsTwitter"])
        {
            socialURL = [NSURL URLWithString:@"https://twitter.com/ztvsports"];
            destination.socialURL = socialURL;
            destination.title = @"Sports Report";
        }
        else if ([segue.identifier isEqualToString:@"lowFacebook"])
        {
            socialURL = [NSURL URLWithString:@"https://www.facebook.com/ZTVLowdown"];
            destination.socialURL = socialURL;
            destination.title = @"Lowdown";
        }
        else if ([segue.identifier isEqualToString:@"lowTwitter"])
        {
            socialURL = [NSURL URLWithString:@"https://twitter.com/lowdownztv"];
            destination.socialURL = socialURL;
            destination.title = @"Lowdown";
        }
        else if ([segue.identifier isEqualToString:@"feedFacebook"])
        {
            socialURL = [NSURL URLWithString:@"https://www.facebook.com/thefeedztv"];
            destination.socialURL = socialURL;
            destination.title = @"The Feed";
        }
        else if ([segue.identifier isEqualToString:@"feedTwitter"])
        {
            socialURL = [NSURL URLWithString:@"https://twitter.com/thefeedztv"];
            destination.socialURL = socialURL;
            destination.title = @"The Feed";
        }
        else if ([segue.identifier isEqualToString:@"chicFacebook"])
        {
            socialURL = [NSURL URLWithString:@"https://www.facebook.com/ZTVsochic"];
            destination.socialURL = socialURL;
            destination.title = @"So Chic";
        }
        else if ([segue.identifier isEqualToString:@"chicTwitter"])
        {
            socialURL = [NSURL URLWithString:@"https://twitter.com/ztvsochic"];
            destination.socialURL = socialURL;
            destination.title = @"So Chic";
        }
    }
    /*else
    {
        UIStoryboard *instagramStoryboard = [UIStoryboard storyboardWithName:@"Instagram" bundle:[NSBundle mainBundle]];
        [instagramStoryboard instantiateInitialViewController];
    }*/
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
