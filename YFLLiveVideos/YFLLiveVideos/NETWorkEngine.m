//
//  NETWorkEngine.m
//  YFLLiveVideos
//
//  Created by 杨丰林 on 2017/6/30.
//  Copyright © 2017年 杨丰林. All rights reserved.
//

#import "NETWorkEngine.h"

@interface NETWorkEngine ()
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation NETWorkEngine
+(instancetype)shareNetEngine{
    static NETWorkEngine *netEngine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netEngine = [[self alloc]init];
    });
    return netEngine;
}

-(AFHTTPSessionManager *)shareManager{
    if (!_manager) {
        self.manager = [[AFHTTPSessionManager alloc]init];
        //申明返回的结果是json类型
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
        //申明请求的数据是json类型
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
        //如果报接受类型不一致请替换一致text/html或别的
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain", nil];
    }
    return _manager;
}


-(void)getDataWithParams:(NSDictionary *)params Success:(void (^)(NSURLSessionDataTask *, id))successSource Failure:(void (^)(NSURLSessionDataTask *, NSError *))failureSource{
    [[self shareManager] GET:liveSoureURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successSource) {
            successSource(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureSource) {
            failureSource(task,error);
        }
    }];
}

@end
