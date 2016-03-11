//
//  AbleFriendTrendsViewController.m
//  budejie
//
//  关注
//
//  Created by 袁冬平 on 16/3/7.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import "AbleFriendTrendsViewController.h"
#import "AbleRecommendViewController.h"

@interface AbleFriendTrendsViewController ()

@end

@implementation AbleFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置导航栏内容
    self.navigationItem.title = @"我的关注";
    
    //设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsClick)];
    
     //设置背景色
    self.view.backgroundColor = AbleGlobaBg;
    
    AbleLogFunc;
}

- (void)friendsClick
{
        AbleLogFunc;
    AbleRecommendViewController *vc = [[AbleRecommendViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
