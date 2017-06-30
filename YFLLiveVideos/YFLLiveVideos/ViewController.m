//
//  ViewController.m
//  YFLLiveVideos
//
//  Created by 杨丰林 on 2017/6/19.
//  Copyright © 2017年 杨丰林. All rights reserved.
//

#import "ViewController.h"
#import "NETWorkEngine.h"
#import "ViewModel.h"


#define randomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    
    [self loadData];
}

-(void)initView{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
}

#pragma UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId"];
    }
    cell.backgroundColor = randomColor;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


-(UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height)];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        self.tableView = tableView;
    }
    return _tableView;
}

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        self.dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

-(void)loadData{
    [[NETWorkEngine shareNetEngine] getDataWithParams:nil Success:^(NSURLSessionDataTask *task, id responseObject) {
        if (responseObject) {
            NSArray *lives = [responseObject objectForKey:@"lives"];
            if (self.dataArr.count) {
                [self.dataArr removeAllObjects];
            }
            for (NSDictionary *dic in lives) {
                ViewModel *viewModel = [[ViewModel alloc]init];
                viewModel.city = dic[@"city"];
                viewModel.portrait = dic[@"creator"][@"portrait"];
                viewModel.name = dic[@"creator"][@"nick"];
                viewModel.online_users = [dic[@"online_users"] intValue];
                viewModel.url = dic[@"stream_addr"];
                [self.dataArr addObject:viewModel];
            }
            
            [self.tableView reloadData];
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
