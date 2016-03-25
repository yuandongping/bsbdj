//
//  AbleRecommendTagsViewController.m
//  bsbdj
//
//  Created by 袁冬平 on 16/3/18.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import "AbleRecommendTagsViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import "AbleRecommendTag.h"
#import "AbleRecommendTagCell.h"

@interface AbleRecommendTagsViewController ()
/** 推荐标签数据  */
@property (nonatomic, strong) NSArray *recommendTags;

@end

@implementation AbleRecommendTagsViewController

static NSString * const AbleTagId = @"recommendTag";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化数据
    [self setupTableView];
    
    //加载推荐标签数据
    [self loadTags];
}

/** 初始化数据 */
- (void)setupTableView
{
    self.title = @"推荐标签";
    self.tableView.rowHeight = 90;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = AbleGlobaBg;
    //注册，循环标识
    [self.tableView registerClass:[AbleRecommendTagCell class] forCellReuseIdentifier:AbleTagId];
}

/** 加载推荐标签数据 */
- (void)loadTags
{
    //显示指示器
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    //发送请求
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success");
        //隐藏指示器
        [SVProgressHUD dismiss];
        
        //服务器返回的json数据
        AbleLog(@"%@", responseObject);
//        self.recommendTags = responseObject[@"list"];
        self.recommendTags = [AbleRecommendTag  mj_objectArrayWithKeyValuesArray:responseObject];
        
        //刷新表格
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure");
        //隐藏指示器
//      [SVProgressHUD dismiss];
        //显示一些失败信息
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败!"];
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recommendTags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    AbleLog(@"%@", self.recommendTags[0]);
    AbleRecommendTagCell *cell = [tableView dequeueReusableCellWithIdentifier:AbleTagId];
    cell.recommendTag = self.recommendTags[indexPath.row];
    return cell;
}

@end
