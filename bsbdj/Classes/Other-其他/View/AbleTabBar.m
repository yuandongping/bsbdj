//
//  AbleTabBar.m
//  budejie
//
//  自定义TabBar
//
//  Created by 袁冬平 on 16/3/8.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import "AbleTabBar.h"

@interface AbleTabBar()
/**发布按钮*/
@property (nonatomic, weak) UIButton *publishButton;
@end

@implementation AbleTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        //设置背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        
        //自定义中间的按钮
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:      UIControlStateHighlighted];
        
        //设置发布按钮的frame
        //    self.publishButton.bounds = CGRectMake(0, 0, self.publishButton.currentBackgroundImage.size.width, self.publishButton.currentBackgroundImage.size.height);
        //    self.publishButton.width = self.publishButton.currentBackgroundImage.size.width;
        //    self.publishButton.height = self.publishButton.currentBackgroundImage.size.height;
        publishButton.size = publishButton.currentBackgroundImage.size;
        [self addSubview:publishButton];
        self.publishButton = publishButton;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width = self.width;
    CGFloat height = self.height;
    self.publishButton.center = CGPointMake(width/2, height/2);
    
    //设置其他UITabBarButton的frame
    CGFloat buttonY = 0;
    CGFloat buttonW = width / 5;
    CGFloat buttonH = height;
    NSInteger index = 0;
    for (UIView *button in self.subviews) {
        //        if(![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        if(![button isKindOfClass:[UIControl class]] || button == self.publishButton) continue;
        {
            //计算按钮的X值
            CGFloat buttonX = buttonW * (index>1 ?(index+1):index);
            button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
            index++;
        }
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
