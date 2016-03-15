//
//  AbleRecommendViewController.m
//  bsbdj
//
//  推荐关注
//
//  Created by 袁冬平 on 16/3/10.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import "AbleRecommendViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import "AbleRecommendCategoryCell.h"
#import <MJExtension.h>
#import "AbleRecommendCategory.h"


@interface AbleRecommendViewController ()<UITableViewDataSource, UITableViewDelegate>

/** 左边的类别数据  */
@property (nonatomic, strong) NSArray *categories;

/**  左边的类别表格 */
@property (weak, nonatomic) IBOutlet UITableView *categoryTabView;

@end

@implementation AbleRecommendViewController

static NSString * const AbleCategoryId = @"category";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //註冊
    [self.categoryTabView registerNib:[UINib nibWithNibName:NSStringFromClass([AbleRecommendCategoryCell class]) bundle:nil] forCellReuseIdentifier:AbleCategoryId];
    
    self.title = @"推荐关注";
    
    //设置背景
    self.view.backgroundColor = AbleGlobaBg;
    
    //显示指示器
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];

    //发送请求
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success");
        //隐藏指示器
        [SVProgressHUD dismiss];
        
        //服务器返回的json数据
        NSLog(@"%@", responseObject);
//        self.categories = responseObject[@"list"];
        self.categories = [AbleRecommendCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //刷新表格
        [self.categoryTabView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure");
        //隐藏指示器
//        [SVProgressHUD dismiss];
        //显示一些失败信息
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败!"];
    }];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AbleRecommendCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:AbleCategoryId];
    cell.category = self.categories[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
