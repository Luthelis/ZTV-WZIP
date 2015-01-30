//
//  InstagramCollectionViewController.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/6/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

#import "InstagramCollectionViewController.h"
#import "InstagramDownloader.h"

#import "InstagramLargePhotoViewController.h"
#import "Instagram.h"
#import "RootTabBarViewController.h"
#import "Instagram+Photos.h"

@interface InstagramCollectionViewController () <NSFetchedResultsSectionInfo>

@property (nonatomic, strong) NSArray *fullSizeImages;
@property (nonatomic, strong) NSArray *thumbnailImages;
@property (nonatomic, strong) InstagramDownloader *downloader;
@property (nonatomic, strong) NSFetchedResultsController *fetchController;
@property (nonatomic) CGRect frameRect;

@end

@implementation InstagramCollectionViewController

@synthesize numberOfObjects;
@synthesize name;
@synthesize indexTitle;
@synthesize objects;

static NSString * const reuseIdentifier = @"thumbImage";

- (CGRect)frameRect
{
    _frameRect = CGRectMake(0, 0, 150, 150);
    return _frameRect;
}
- (InstagramDownloader *)downloader
{
    if (!_downloader) {
        _downloader = [[InstagramDownloader alloc] init];
        _downloader.context = self.context;
    }
    return _downloader;
}

- (NSFetchedResultsController *)fetchController
{
    if (!_fetchController)
    {
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Instagram"];
        NSSortDescriptor *sorter = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
        NSArray *sortDescripters = [[NSArray alloc] initWithObjects:sorter, nil];
        //NSPredicate *predicate = [NSPredicate predicateWithFormat:self.stationName];
        [request setSortDescriptors:sortDescripters];
        //request.predicate = predicate;
        _fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.context sectionNameKeyPath:nil cacheName:@"request_cache"];
    }
    return _fetchController;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(parseBackgroundDownloadInformation:) name:@"Download Complete" object:nil];
    //NSURL *instagramURL;
    //if ([self.stationName isEqualToString:@"ZTV"]) instagramURL = ;
    //else if ([self.stationName isEqualToString:@"WZIP"]) instagramURL = ;
    //else instagramURL = nil;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        // Do any additional setup after loading the view.
    if ([self.tabBarController isKindOfClass:[RootTabBarViewController class]])
    {
        RootTabBarViewController *customTabBarController = self.tabBarController;
        self.context = customTabBarController.context;
    }
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.contentSize = CGSizeMake(self.frameRect.size.width, self.frameRect.size.height);
    NSURLRequest *instagramRequest = [NSURLRequest requestWithURL:self.stationURL];
    [self.downloader beginBackgroundDownload:instagramRequest withSessionIdentifer:self.stationName];
    NSError *error;
    [self.fetchController performFetch:&error];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)parseBackgroundDownloadInformation:(NSNotification *)notification
{
    NSError *jsonError;
    NSDictionary *jsonInfo = [NSJSONSerialization JSONObjectWithData:[notification.userInfo objectForKey:@"data"] options:NSJSONReadingMutableContainers error:&jsonError];
    NSArray *jsonData = [jsonInfo valueForKey:@"data"];
    //NSDictionary *instagramData = [NSArray arrayWithArray:jsonData];
    //NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Instagram"];
    //NSError *requestError;
    //NSArray *items = [self.context executeFetchRequest:request error:&requestError];
    [self.downloader jsonParser:jsonData forFetchedResultsController:self.fetchController];
    NSError *fetchError;
    [self.fetchController performFetch:&fetchError];
    [self.collectionView reloadData];

}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    InstagramLargePhotoViewController *destination = [segue destinationViewController];
    
     
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete method implementation -- Return the number of sections
    return [[self.fetchController sections] count];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete method implementation -- Return the number of items in the section
    NSInteger rows;// = 0;
    /*if ([[self.fetchController sections] count] > 0)
    {
        id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchController sections] objectAtIndex:section];
        rows = [sectionInfo numberOfObjects];
    }*/
    rows = [self.fetchController.fetchedObjects count];
    return rows;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    // Configure the cell
    Instagram *photo = [self.fetchController objectAtIndexPath:indexPath];
    //cell.thumbnail.image = [UIImage imageWithData:photo.thumbPhoto];
    UIImageView *thumbView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:photo.thumbPhoto]];
    [thumbView setNeedsDisplay];
    [cell addSubview:thumbView];
    
    return cell;
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
