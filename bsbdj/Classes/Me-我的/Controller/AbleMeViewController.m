//
//  AbleMeViewController.m
//  budejie
//
//  关注
//
//  Created by 袁冬平 on 16/3/7.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import "AbleMeViewController.h"

@interface AbleMeViewController ()

@end

@implementation AbleMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置导航栏内容
    self.title = @"我的";
    
    //设置导航栏右边的按钮
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
    
    //设置背景色
    self.view.backgroundColor = AbleGlobaBg;
    
    AbleLogFunc;
}

- (void)settingClick
{
    AbleLogFunc;
}

/**夜间模式*/
- (void)moonClick
{
    AbleLogFunc;
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
