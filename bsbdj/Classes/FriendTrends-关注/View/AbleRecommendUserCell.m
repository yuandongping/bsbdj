//
//  AbleRecommendUserCell.m
//  bsbdj
//
//  Created by 袁冬平 on 16/3/16.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import "AbleRecommendUserCell.h"
#import "AbleRecommendUser.h"
#import "UIImageView+WebCache.h"

@interface AbleRecommendUserCell()
/**头像*/
@property (nonatomic, strong) UIImageView *headerImageView;
//
///**名称*/
@property (nonatomic, strong) UILabel *screenNameLabel;
//
///**粉丝数量*/
@property (nonatomic, strong) UILabel *fansCountLabel;
//
///**关注按钮*/
@property (nonatomic, strong) UIButton *guazhuButton;

@end

@implementation AbleRecommendUserCell


- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //1、初始化
    UIImageView *headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 12.5, 50, 50)];
    UILabel *screenNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, 120, 25)];
    UILabel *fansCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 40, 120, 25)];
    UIButton *guazhuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    guazhuButton.frame = CGRectMake(180, 25, 50, 25);
    
    screenNameLabel.font = [UIFont systemFontOfSize:14.0];
    fansCountLabel.font = [UIFont systemFontOfSize:12.0];
    fansCountLabel.textColor = [UIColor grayColor];
    
    [guazhuButton setTitle:@"+ 关注" forState:UIControlStateNormal];
    [guazhuButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [guazhuButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    guazhuButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    
    [guazhuButton setBackgroundImage:[UIImage imageNamed:@"FollowBtnBg"] forState:UIControlStateNormal];
    [guazhuButton setBackgroundImage:[UIImage imageNamed:@"FollowBtnClickBg"] forState:UIControlStateHighlighted];
    guazhuButton.size = CGSizeMake(50, 25);
        //让按钮内部的所有内容左对齐
    guazhuButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;

//    [guazhuButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    //2、添加
    [self addSubview:self.headerImageView = headerImageView];
    [self addSubview:self.screenNameLabel = screenNameLabel];
    [self addSubview:self.fansCountLabel = fansCountLabel];
    [self addSubview:self.guazhuButton = guazhuButton];
    return self;
}

- (void) setUser:(AbleRecommendUser *)user
{
    _user = user;
    self.screenNameLabel.text = user.screen_name;
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    NSString *fansCount= nil;
    if (user.fans_count < 10000) {
        fansCount = [NSString stringWithFormat:@"%zd人关注", user.fans_count];
    }else{
        fansCount = [NSString stringWithFormat:@"%.1f万人关注", user.fans_count / 10000.0];
    }
    self.fansCountLabel.text = fansCount;
}

@end
