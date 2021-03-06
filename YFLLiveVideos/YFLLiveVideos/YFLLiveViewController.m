//
//  YFLLiveViewController.m
//  YFLLiveVideos
//
//  Created by 杨丰林 on 2017/7/4.
//  Copyright © 2017年 杨丰林. All rights reserved.
//

#import "YFLLiveViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
#define ScreenW [[UIScreen mainScreen]bounds].size.width
#define ScreenH [[UIScreen mainScreen]bounds].size.height
@interface YFLLiveViewController ()
@property (nonatomic, strong) NSURL *url;
@property (atomic, retain) id <IJKMediaPlayback> player;
@property (weak, nonatomic) UIView *PlayerView;

@end

@implementation YFLLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initView];

    [self initPlayer];
}

-(void)initView{
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)initPlayer{
    _url = [NSURL URLWithString:_urlStr];
    _player = [[IJKFFMoviePlayerController alloc] initWithContentURL:self.url withOptions:nil];
    _PlayerView = [_player view];
    _PlayerView.bounds = CGRectMake(0, 64, ScreenW, ScreenH-64);
    [self.view addSubview:_PlayerView];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    /**
     *  开始生成 设备旋转 通知
     */
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    /**
     *  添加 设备旋转 通知
     *
     *  当监听到 UIDeviceOrientationDidChangeNotification 通知时，调用handleDeviceOrientationDidChange:方法
     *  @param handleDeviceOrientationDidChange: handleDeviceOrientationDidChange: description
     *
     *  @return return value description
     */
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleDeviceOrientationDidChange:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil
     ];

    
    
    
    //[self.navigationController setNavigationBarHidden:YES];
    
    if (![self.player isPlaying]) {
        // 准备播放
        [self.player prepareToPlay];
    }
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    // 停播
    [self.player shutdown];
    
    
    
    /**
     *  销毁 设备旋转 通知
     *
     *  @return return value description
     */
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIDeviceOrientationDidChangeNotification
                                                  object:nil
     ];
    /**
     *  结束 设备旋转通知
     *
     *  @return return value description
     */
    [[UIDevice currentDevice]endGeneratingDeviceOrientationNotifications];
    
}


#pragma mark - 屏幕旋转通知
- (void)handleDeviceOrientationDidChange:(UIInterfaceOrientation)interfaceOrientation
{
    //1.获取 当前设备 实例
    UIDevice *device = [UIDevice currentDevice] ;
    
    /**
     *  2.取得当前Device的方向，Device的方向类型为Integer
     *
     *  必须调用beginGeneratingDeviceOrientationNotifications方法后，此orientation属性才有效，否则一直是0。orientation用于判断设备的朝向，与应用UI方向无关
     *
     *  @param device.orientation
     *
     */
    
    switch (device.orientation) {
        case UIDeviceOrientationFaceUp:
            NSLog(@"屏幕朝上平躺");
            _PlayerView.bounds = CGRectMake(0, 64, ScreenW, ScreenH-64);
            break;
            
        case UIDeviceOrientationFaceDown:
            NSLog(@"屏幕朝下平躺");
            _PlayerView.bounds = CGRectMake(0, 64, ScreenW, ScreenH-64);
            break;
            
            //系統無法判斷目前Device的方向，有可能是斜置
        case UIDeviceOrientationUnknown:
            NSLog(@"未知方向");
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"屏幕向左横置");
            _PlayerView.bounds = CGRectMake(0, 44, ScreenH, ScreenW-44);
            break;
            
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"屏幕向右橫置");
            _PlayerView.bounds = CGRectMake(0, 44, ScreenH, ScreenW-44);
            break;
            
        case UIDeviceOrientationPortrait:
            NSLog(@"屏幕直立");
            _PlayerView.bounds = CGRectMake(0, 64, ScreenW, ScreenH-64);
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            NSLog(@"屏幕直立，上下顛倒");
            _PlayerView.bounds = CGRectMake(0, 64, ScreenW, ScreenH-64);
            break;
            
        default:
            NSLog(@"无法辨识");
            break;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
