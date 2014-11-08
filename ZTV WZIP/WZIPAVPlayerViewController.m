//
//  WZIPAVPlayerViewController.m
//  ZTV WZIP
//
//  Created by Timothy Transue on 11/3/14.
//  Copyright (c) 2014 University of Akron. All rights reserved.
//

#import "WZIPAVPlayerViewController.h"
@import MediaPlayer;

@implementation WZIPAVPlayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
    NSURL *playerURL = [[NSURL alloc] initWithString:@"http://216.235.91.31/play?now=37&membername=&session=1415046663-493854&tag=live365&s=wzip&d=LIVE365&r=0&app_id=live365%3ABROWSER%28pro%29&token=a16c1471102324fbf674bad606754809-3120030080700000&AuthType=NORMAL&lid=510-usa&SaneID=130.101.20.202-1414607252816&rnd=0.5246827960945666"];
    AVPlayer *wzipPlayer = [[AVPlayer alloc] initWithURL:playerURL];
    self.player = wzipPlayer;
    [self wzipAudioSession];
    [self.player play];
    
}

- (void)configureControlCenter
{
    MPNowPlayingInfoCenter *center = [MPNowPlayingInfoCenter defaultCenter];
    center.nowPlayingInfo = [[NSDictionary alloc] initWithObjectsAndKeys:@"WZIP FM", nil];
}

- (void)wzipAudioSession
{
    AVAudioSession *wzip = [AVAudioSession sharedInstance];
    [wzip setCategory:AVAudioSessionCategoryPlayback error:nil];
    [wzip setActive:YES withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
}

- (BOOL)canBecomeFirstResponder
{
    [super canBecomeFirstResponder];
    return YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self resignFirstResponder];
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
}

- (void)didReceiveMemoryWarning
{
    
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)receivedEvent {
    
    if (receivedEvent.type == UIEventTypeRemoteControl) {
        
        switch (receivedEvent.subtype) {
                
            case UIEventSubtypeRemoteControlTogglePlayPause:
                [self playOrStop: nil];
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

- (void)playOrStop:(id)sender
{

}

@end
