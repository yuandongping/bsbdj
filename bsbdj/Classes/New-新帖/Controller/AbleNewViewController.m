//
//  AbleNewViewController.m
//  budejie
//
//  新帖
//
//  Created by 袁冬平 on 16/3/7.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import "AbleNewViewController.h"

@interface AbleNewViewController ()

@end

@implementation AbleNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置导航栏内容
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
    //设置背景色
    self.view.backgroundColor = AbleGlobaBg;
    
    AbleLogFunc;
}

- (void)tagClick
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
