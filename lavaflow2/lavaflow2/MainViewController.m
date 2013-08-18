//
//  MainViewController.m
//  lavaflow2
//
//  Created by macbook on 2013/08/18.
//  Copyright (c) 2013年 macbook. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize player;

// 動画の再生処理
- (void)playMoive
{
    // 再生する動画を指定
    NSString *path;
    path = [[NSBundle mainBundle] pathForResource:@"Movie" ofType:@"m4v"];
    NSURL *url;
    url = [NSURL fileURLWithPath:path];
    // ネット上にある動画を再生する場合はURLで指定
    // url = [NSURL URLWithString:@"http://..."];
	
    player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
	player.controlStyle = MPMovieControlStyleNone;
	
	// ムービープレイヤーのスケールモードを設定
	player.scalingMode = MPMovieScalingModeAspectFill;
	
	CGRect movieSize = CGRectMake(0, 100, 320, 240);
	//[player.view setFrame:[self.view bounds]];  // frame must match parent view
    [player.view setFrame:movieSize];
    player.backgroundView.backgroundColor = [UIColor clearColor];
    
    //CGAffineTransform transform = player.view.transform;
	
	//player.view.transform = CGAffineTransformIdentity;
	
	// position (0,0)
	//transform = CGAffineTransformTranslate(transform, 0, 120);
	// Rotate the view -90 degrees.
	//transform = CGAffineTransformRotate(transform, (M_PI / -2.0));
	// Scale 175%
	//transform = CGAffineTransformScale(transform, 1.75, 1.75);
	
	//player.view.transform = transform;
	
    //	CGRect newFrame = player.view.frame;
    //	newFrame.origin.x = 190;
    //	player.view.frame = newFrame;
	
	[self.view addSubview:player.view];
	
	
	// Register to receive a notification that the movie is now in memory and ready to play
	[[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector(moviePlayerLoadStateDidChangeNotification:)
	 name:MPMoviePlayerLoadStateDidChangeNotification
	 object:player];
	
    // 再生終了のNotificationを設定
    [[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector(finishPlayback:)
	 name:MPMoviePlayerPlaybackDidFinishNotification
	 object:player];
	
    //	[player prepareToPlay];
	[player play];
    NSLog(@"playing");
}


//  Notification called when the movie finished preloading.
- (void) moviePlayerLoadStateDidChangeNotification:(NSNotification*)notification
{
	NSLog(@"preloaded");
    //	[player play];
}

// 動画の再生終了
- (void) finishPlayback:(NSNotification *) aNotification
{
	[player play];
    NSLog(@"finished");
	
    //    MPMoviePlayerController *p = [aNotification object];
    //    [[NSNotificationCenter defaultCenter]
    //	 removeObserver:self
    //	 name:MPMoviePlayerPlaybackDidFinishNotification
    //	 object:p];
    //
    //    [p stop];
    //    [p release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self playMoive];
    NSLog(@"viewDid");
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
