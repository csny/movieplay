//
//  MainViewController.h
//  lavaflow2
//
//  Created by macbook on 2013/08/18.
//  Copyright (c) 2013年 macbook. All rights reserved.
//

#import "FlipsideViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property (nonatomic, retain) MPMoviePlayerController *player;
@end
