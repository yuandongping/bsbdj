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
#import "AbleRecommendCategory.h"
#import <MJExtension.h>
#import "AbleRecommendUserCell.h"
#import "AbleRecommendUser.h"
#import <MJRefresh.h>

#define AbleSelectedCategory self.categories[self.categoryTabView.indexPathForSelectedRow.row]

@interface AbleRecommendViewController ()<UITableViewDataSource, UITableViewDelegate>

/** 左边的类别数据  */
@property (nonatomic, strong) NSArray *categories;
/** 右边的用户数据  */
//@property (nonatomic, strong) NSArray *users;

/**  左边的类别表格 */
@property (weak, nonatomic) IBOutlet UITableView *categoryTabView;
@property (weak, nonatomic) IBOutlet UITableView *userTabView;

/** 请求参数 */
@property (nonatomic, strong) IBOutlet NSMutableDictionary *params;

/** AFN请求管理者 */
@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation AbleRecommendViewController

static NSString * const AbleCategoryId = @"category";
static NSString * const AbleUserId = @"user";

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化数据
    [self setupTableView];
    
    //添加刷新控件
    [self setupRefresh];
    
    //加载左侧的类别数据
    [self loadCategories];
}

/**  加载左侧类别数据 */
- (void) loadCategories
{
    //显示指示器
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    //发送请求
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success");
        //隐藏指示器
        [SVProgressHUD dismiss];
        
        //服务器返回的json数据
        //        NSLog(@"%@", responseObject);
        //        self.categories = responseObject[@"list"];
        self.categories = [AbleRecommendCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //刷新表格
        [self.categoryTabView reloadData];
        
        
        //默认选择首行
        [self.categoryTabView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
        //让右侧用户表格进入下拉刷新状态
        [self.userTabView.mj_header beginRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure");
        //隐藏指示器
        //        [SVProgressHUD dismiss];
        //显示一些失败信息
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败!"];
    }];
}


/**初始化数据*/
- (void) setupTableView
{
    //註冊
    [self.categoryTabView registerNib:[UINib nibWithNibName:NSStringFromClass([AbleRecommendCategoryCell class]) bundle:nil] forCellReuseIdentifier:AbleCategoryId];
    
    //1、这个是xib文件写的布局的加载方式
    //   [self.userTabView registerNib:[UINib nibWithNibName:NSStringFromClass([AbleRecommendUserCell class]) bundle:nil] forCellReuseIdentifier:AbleUserId];
    
    //2、这个是代码布局加载方式
    [self.userTabView registerClass:[AbleRecommendUserCell class] forCellReuseIdentifier:AbleUserId];
    //
    //设置inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categoryTabView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userTabView.contentInset = self.categoryTabView.contentInset;
    
    //设置标题
    self.title = @"推荐关注";
    
    //设置背景
    self.view.backgroundColor = AbleGlobaBg;
}

/**添加刷新控件*/
- (void) setupRefresh
{
    self.userTabView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers)];
    
    self.userTabView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    self.userTabView.mj_footer.hidden = YES;
    
}

#pragma mark - 下拉刷新
- (void) loadNewUsers
{
    AbleRecommendCategory *rc = AbleSelectedCategory;
    
    //设置当前页码为1
    rc.currentPage = 1;
    
    //发送请求给服务器，加载右侧的数据
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(rc.id);
    params[@"page"] = @(rc.currentPage);
    self.params = params;
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        AbleLog(@"%@", responseObject);
        //字典数组 -> 模型数组
        NSArray *users = [AbleRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        //        AbleLog(@"%@", users);
        
        //先清除所有旧数据
        [rc.users removeAllObjects];
        
        //添加到当前类别对应的用户数组中
        [rc.users addObjectsFromArray:users];
        
        //保存总数
        rc.total = [responseObject[@"total"] integerValue];
        //不是最后一次请求
        if (self.params != params) return;
        
        //刷新右边的表格
        [self.userTabView reloadData];
        
        //结束刷新
        [self.userTabView.mj_header endRefreshing];
        
        //让底部控件结束刷新
        [self checkFooterState];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        AbleLog(@"%@", error);
        if (self.params != params) return;
        //失败提醒
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        
        //让下拉控件结束刷新
        [self.userTabView.mj_header endRefreshing];
    }];
}

#pragma mark - 加载用户数据(加载更多)
- (void) loadMoreUsers
{
    AbleRecommendCategory *category = AbleSelectedCategory;
    
    //发送请求给服务器，加载右侧的数据
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @([category id]);
    params[@"page"] = @(++category.currentPage);
    self.params = params;
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //        AbleLog(@"%@", responseObject[@"list"]);
        
        //字典数组 -> 模型数组
        NSArray *users = [AbleRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
//        AbleLog(@"++++%@++++++", users);
        
        //添加到当前类别对应的用户数组中
        [category.users addObjectsFromArray:users];
        
        //不是最后一次请求
        if (self.params != params) return;
        
        //刷新右边的表格
        [self.userTabView reloadData];
        
        //让底部控件结束刷新
        [self checkFooterState];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.params != params) return;
        //        AbleLog(@"%@", error);
        //错误提醒
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        
        //让底部控件结束刷新
        [self.userTabView.mj_footer endRefreshing];
    }];
}

/**时刻检测footer的状态*/
- (void)checkFooterState
{
    //宏定义
    //    AbleRecommendCategory *c = self.categories[self.categoryTabView.indexPathForSelectedRow.row];
    
    AbleRecommendCategory *rc = AbleSelectedCategory;
    //每次刷新右边数据时，都控制footer显示或隐藏
    //        self.userTabView.mj_footer.hidden = (c.users.count == 0);
    self.userTabView.mj_footer.hidden = (rc.users.count == 0);
    
    //让底部控件结束刷新
    if (rc.users.count == rc.total) {//全部数据已经加载完毕
        [self.userTabView.mj_footer endRefreshingWithNoMoreData];
    }else{
        [self.userTabView.mj_footer endRefreshing];
    }
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == self.categoryTabView){//左边的类别表格
        return self.categories.count;
    }else {//右边用户表格
        //让底部控件结束刷新
        [self checkFooterState];
        return [AbleSelectedCategory users].count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == self.categoryTabView){//左边的类别表格
        AbleRecommendCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:AbleCategoryId];
        cell.category = self.categories[indexPath.row];
        return cell;
    }else{//右边用户表格
        AbleRecommendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:AbleUserId];
        //        AbleRecommendCategory *c = self.categories[self.categoryTabView.indexPathForSelectedRow.row];
        cell.user =  [AbleSelectedCategory users][indexPath.row];
        return cell;
    }
}

#pragma mark - <UITabViewDelegate>
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //先结束刷新
    [self.userTabView.mj_header endRefreshing];
    [self.userTabView.mj_footer endRefreshing];
    
    AbleRecommendCategory *c = self.categories[indexPath.row];
    //    AbleLog(@"%@",c.name);
    
    [self.userTabView.mj_footer endRefreshingWithNoMoreData];
    
    if(c.users.count){    //右边曾经有数据
        //显示曾经的数据, 直接刷新右边的表格
        [self.userTabView reloadData];
    }else{
        //及时刷新表格，：目的是不让用户看到上一个category的数据
        [self.userTabView reloadData];
        
        //进入下拉刷新状态
        [self.userTabView.mj_header beginRefreshing];
    }
}

#pragma mark - 控制器的销毁
- (void) dealloc
{
    //停止所有的操作
    [self.manager.operationQueue cancelAllOperations];
}

/**
 需要解决的问题
 
 *1、重复发送请求(ok)
 *2、目前只能显示1页数据(ok)
 *3、网络慢带来的细节问题（ok）
 */
@end
