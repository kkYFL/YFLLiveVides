//
//  AppDelegate.m
//  YFLLiveVideos
//
//  Created by 杨丰林 on 2017/6/19.
//  Copyright © 2017年 杨丰林. All rights reserved.
//

#import "AppDelegate.h"
#import "MainNavgationController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]init];
    self.window.frame = [[UIScreen mainScreen]bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    ViewController *mainView = [[ViewController alloc]init];
    MainNavgationController  *mainNav = [[MainNavgationController alloc]initWithRootViewController:mainView];
    self.window.rootViewController = mainNav;
    
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {

}


@end
