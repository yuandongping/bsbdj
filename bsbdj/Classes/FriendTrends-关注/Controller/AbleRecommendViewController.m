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

@interface AbleRecommendViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation AbleRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推荐关注";
    
    //设置背景
    self.view.backgroundColor = AbleGlobaBg;
    
//    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    //发送请求
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"success");
        //隐藏指示器
        [SVProgressHUD dismiss];
        
        //数据
        NSLog(@"%@", responseObject);
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
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
