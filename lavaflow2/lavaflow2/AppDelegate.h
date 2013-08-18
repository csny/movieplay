//
//  AppDelegate.h
//  lavaflow2
//
//  Created by macbook on 2013/08/18.
//  Copyright (c) 2013年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *viewController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) IBOutlet MainViewController *viewController;


@end
