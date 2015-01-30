//
//  WZIPViewController.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/26/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

#import "WZIPViewController.h"

@interface WZIPViewController () <NSXMLParserDelegate>


@end

@implementation WZIPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self buttonTextChanger];
}
- (AVPlayer *)player
{
    if (!_player) {
        _player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:@"http://www.live365.com/play/wzip?now=36&tag=live365&auth=22bbbc3fe8781225fd4e52e73f9f6dc4-1415827314-wzip&membername=&session=1415798514-330098&rnd=0.6353352852165699"]];
    }
    return _player;
}
- (void)wzipAudioSession
{
    AVAudioSession *wzip = [AVAudioSession sharedInstance];
    [wzip setCategory:AVAudioSessionCategoryPlayback error:nil];
    [wzip setActive:YES withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
}
- (NSDictionary *)playlistDictionary
{
    long long currentMillisTime = (long long)([[NSDate date] timeIntervalSince1970] * 1000.0);
    NSMutableArray *urls = [[NSMutableArray alloc] init];
    NSURL *playlistURL;
    for (int index = 0; index == 199999; index++)
    {
        playlistURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.live365.com/pls/front?handler=playlist&cmd=view&viewType=xml&handle=wzip&maxEntries=3&tm=%lld", currentMillisTime-index]];
        [urls addObject:playlistURL];
    };
    for (NSURL *primaryURL in urls) {
        if ([primaryURL isFileURL]) {
            NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:playlistURL];
            parser.delegate = self;
            [parser parse];
        }
    }
    return _playlistDictionary;
}
- (BOOL)canBecomeFirstResponder
{
    [super canBecomeFirstResponder];
    return YES;
}

- (void)buttonTextChanger
{
    if (self.player.rate == 0) {
        self.playerButton.titleLabel.text = @"Listen live now via Live365.com";
    }
    else if (self.player.rate == 1.0)
    {
        self.playerButton.titleLabel.text = @"Pause the radio station";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)playRadio:(UIButton *)sender
{
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
    [self wzipAudioSession];
    [self playOrStop];
    //[self configureControlCenter];
    
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)receivedEvent {
    
    if (receivedEvent.type == UIEventTypeRemoteControl) {
        
        switch (receivedEvent.subtype) {
                
            case UIEventSubtypeRemoteControlTogglePlayPause:
                [self playOrStop];
                [self buttonTextChanger];
                break;
                
                /*case UIEventSubtypeRemoteControlPreviousTrack:
                 [self previousTrack: nil];
                 break;*/
                
                /*case UIEventSubtypeRemoteControlNextTrack:
                 [self nextTrack: nil];
                 break;*/
                
            default:
                break;
        }
    }
}

- (void)playOrStop
{
    if (self.player.rate == 1.0) self.player.rate = 0.0;
    else if (self.player.rate == 0.0) self.player.rate = 1.0;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"Title"])
    {
        self.title = [attributeDict objectForKey:@"Title"];
    }
    if ([elementName isEqualToString:@"Artist"])
    {
        self.artist = [attributeDict objectForKey:@"Artist"];
    }
    if ([elementName isEqualToString:@"visualURL"])
    {
        self.imageURL = [NSURL URLWithString:[attributeDict objectForKey:@"visualURL"]];
    }
    if ([elementName isEqualToString:@"Refresh"])
    {
        /*NSNumber *refresh = [attributeDict objectForKey:@"Refresh"];
         NSTimeInterval refreshInterval = refresh.doubleValue;
         NSDate *refreshTime = [[NSDate alloc] initWithTimeInterval:refreshInterval sinceDate:[NSDate date]];*/
    }
    NSArray *keys = [[NSArray alloc] initWithObjects:@"Title", @"Artist", @"visualURL", nil];
    NSArray *objects = [[NSArray alloc] initWithObjects:self.title, self.artist, self.imageURL, nil];
    NSLog(@"Title is %@, Artist is %@, Artwork address is %@", self.title, self.artist, self.imageURL);
    NSDictionary *musicInfoDictionary = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
    self.playlistDictionary = musicInfoDictionary;
}

- (void)dealloc
{
    [self resignFirstResponder];
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
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
