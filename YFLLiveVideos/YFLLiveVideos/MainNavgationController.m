//
//  MainNavgationController.m
//  YFLLiveVideos
//
//  Created by 杨丰林 on 2017/7/4.
//  Copyright © 2017年 杨丰林. All rights reserved.
//

#import "MainNavgationController.h"
#import "ViewController.h"

@interface MainNavgationController ()

@end

@implementation MainNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(BOOL)shouldAutorotate{
    id currentViewController = self.topViewController;
    if ([currentViewController isKindOfClass:[ViewController class]]) {
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
