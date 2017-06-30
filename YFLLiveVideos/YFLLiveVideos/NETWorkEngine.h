//
//  NETWorkEngine.h
//  YFLLiveVideos
//
//  Created by 杨丰林 on 2017/6/30.
//  Copyright © 2017年 杨丰林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
//typedef void  (^requestSuccess)(NSURLSessionDataTask *task, id responseObject);
//typedef void  (^requestFailure)(NSURLSessionDataTask *task, NSError *error);
#define liveSoureURL [NSString stringWithFormat:@"http://service.ingkee.com/api/live/gettop?imsi=&uid=17800399&proto=5&idfa=A1205EB8-0C9A-4131-A2A2-27B9A1E06622&lc=0000000000000026&cc=TG0001&imei=&sid=20i0a3GAvc8ykfClKMAen8WNeIBKrUwgdG9whVJ0ljXi1Af8hQci3&cv=IK3.1.00_Iphone&devi=bcb94097c7a3f3314be284c8a5be2aaeae66d6ab&conn=Wifi&ua=iPhone&idfv=DEBAD23B-7C6A-4251-B8AF-A95910B778B7&osversion=ios_9.300000&count=5&multiaddr=1"]

@interface NETWorkEngine : NSObject

+(instancetype)shareNetEngine;

-(void)getDataWithParams:(NSDictionary *)params Success:(void (^)(NSURLSessionDataTask *task, id responseObject))successSource Failure:(void (^) (NSURLSessionDataTask *task, NSError *error))failureSource;

@end
