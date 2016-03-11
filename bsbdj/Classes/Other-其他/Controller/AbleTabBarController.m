//
//  AbleTabBarController.m
//  budejie
//
//  主界面的Controller
//
//  Created by 袁冬平 on 16/3/7.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import "AbleTabBarController.h"
#import "AbleEssenceViewController.h"
#import "AbleNewViewController.h"
#import "AbleFriendTrendsViewController.h"
#import "AbleMeViewController.h"
#import "AbleTabBar.h"
#import "AbleNavigationController.h"

/**
 *    [UIColor colorWithRed:<#(CGFloat)#> green:<#(CGFloat)#> blue:<#(CGFloat)#> alpha:<#(CGFloat)#>]
 * 颜色
 
 24bit颜色   R G B
 32bit颜色 A R G B
 
 灰色的特点:RGB一样
 
 */
@interface AbleTabBarController ()

@end

@implementation AbleTabBarController

+ (void)initialize
{
    //字体默认的颜色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    attrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    //字体选中的颜色
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    selectAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    selectAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    //从根部解决字体（UI_APPEARANCE_SELECTOR）
    //通过appearance统一设置所有的UITabBarItem的文字属性
    //后面带有UI_APPEARANCE_SELECTOR的方法，都可以通过appearance对象统一设置
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //图片保持不被渲染,已在图片位置，从根本上处理了。
    //    UIImage *image = [UIImage imageNamed:@"tabBar_essence_click_icon"];
    //    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    vc01.tabBarItem.selectedImage = image;
    
    //添加子控制器
    [self setupChildVc:[[AbleEssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectImage:@"tabBar_essence_click_icon"];
    [self setupChildVc:[[AbleNewViewController alloc] init]title:@"新帖" image:@"tabBar_new_icon" selectImage:@"tabBar_new_click_icon"];
    [self setupChildVc:[[AbleFriendTrendsViewController alloc] init]title:@"关注" image:@"tabBar_friendTrends_icon" selectImage:@"tabBar_friendTrends_click_icon"];
    [self setupChildVc:[[AbleMeViewController alloc] init]title:@"我的" image:@"tabBar_me_icon" selectImage:@"tabBar_me_click_icon"];

    //    self.tabBar = [[AbleTabBar alloc] init];
    //使用自定义tabBar
    [self setValue:[[AbleTabBar alloc] init] forKey:@"tabBar"];
}

/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *) vc title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage
{
    //    UIViewController *vc = [[UIViewController alloc] init];
    
    //设置文字，和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    //设置字体
    //    [vc.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
    //    [vc.tabBarItem setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
    
    //随机颜色
//        vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/100.0 green:arc4random_uniform(255)/100.0 blue:arc4random_uniform(255)/100.0 alpha:1.0];
//    vc.view.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue: 223/255.0 alpha:1.0];
    
    //AbleNavigationController：自定义导航控制器
    //包装一个导航控制器，添加导航控制器为tabBarController的子控制器
    AbleNavigationController *nav = [[AbleNavigationController alloc] initWithRootViewController:vc];
    
    //添加子控件
    [self addChildViewController:nav];
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
