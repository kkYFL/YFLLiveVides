//
//  ViewModel.m
//  ZombieMovie
//
//  Created by apple on 16/6/9.
//  Copyright © 2016年 一位97年的iOS开发者,喜欢学习新知识(姿势😄),如果你和我有相同爱好就加我🐧:450002197,记得备注iOS开发者. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel

-(id)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.city = [NSString stringWithFormat:@"%@",[dic objectForKey:@"city"]];
        self.portrait = [NSString stringWithFormat:@"%@",[[dic objectForKey:@"creator"] objectForKey:@"portrait"]];
        self.name = [NSString stringWithFormat:@"%@",[[dic objectForKey:@"creator"] objectForKey:@"nick"]];
        self.online_users = [[dic objectForKey:@"online_users"] integerValue];
        self.url = [NSString stringWithFormat:@"%@",dic[@"stream_addr"]];
    }
    return self;
}




@end
