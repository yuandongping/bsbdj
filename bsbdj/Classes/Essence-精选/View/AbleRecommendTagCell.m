//
//  AbleRecommendTagCell.m
//  bsbdj
//
//  Created by 袁冬平 on 16/3/18.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import "AbleRecommendTagCell.h"
#import "UIImageView+WebCache.h"
#import "AbleRecommendTag.h"


@interface AbleRecommendTagCell()

/**头像*/
@property (nonatomic, strong) UIImageView *headerImageView;
//
///**名称*/
@property (nonatomic, strong) UILabel *headNameLabel;
//
///**粉丝数量*/
@property (nonatomic, strong) UILabel *subscriptionCountLabel;
//
///**关注按钮*/
@property (nonatomic, strong) UIButton *subscriptionButton;

@end

@implementation AbleRecommendTagCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //1、初始化
    UIImageView *headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 12.5, 60, 60)];
    
    headerImageView.layer.masksToBounds = YES; //没这句话它圆不起来
    headerImageView.layer.cornerRadius = 8.0; //设置图片圆角的尺度
    
    UILabel *screenNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 18, 120, 25)];
    UILabel *fansCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 45, 120, 25)];
    UIButton *guazhuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    guazhuButton.frame = CGRectMake(240, 32.5, 60, 30);
    screenNameLabel.font = [UIFont systemFontOfSize:14.0];
    fansCountLabel.font = [UIFont systemFontOfSize:12.0];
    fansCountLabel.textColor = [UIColor grayColor];
    
    [guazhuButton setTitle:@"+ 订阅" forState:UIControlStateNormal];
    [guazhuButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [guazhuButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    guazhuButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    
    [guazhuButton setBackgroundImage:[UIImage imageNamed:@"FollowBtnBg"] forState:UIControlStateNormal];
    [guazhuButton setBackgroundImage:[UIImage imageNamed:@"FollowBtnClickBg"] forState:UIControlStateHighlighted];
    guazhuButton.size = CGSizeMake(50, 25);
    //让按钮内部的所有内容左对齐
    guazhuButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    //        [guazhuButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    //2、添加
    [self addSubview:self.headerImageView = headerImageView];
    [self addSubview:self.headNameLabel = screenNameLabel];
    [self addSubview:self.subscriptionCountLabel = fansCountLabel];
    [self addSubview:self.subscriptionButton = guazhuButton];
    return self;
}

-(void) setRecommendTag:(AbleRecommendTag *)recommendTag
{
       _recommendTag = recommendTag;
//    AbleLog(@"===========");
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:recommendTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];

    self.headNameLabel.text = recommendTag.theme_name;
    NSString *subNumber = nil;
    if (recommendTag.sub_number < 10000) {
        subNumber = [NSString stringWithFormat:@"%zd人订阅", recommendTag.sub_number];
    }else{
        subNumber = [NSString stringWithFormat:@"%.1f万人订阅", recommendTag.sub_number / 10000.0];
    }
    self.subscriptionCountLabel.text = subNumber;
}

-(void)setFrame:(CGRect)frame
{
//    AbleLog(@"setFrame——————>%@", NSStringFromCGRect(frame));
    
    frame.origin.x = 5;
    frame.size.width -= 2 * frame.origin.x;
    frame.size.height -= 1;
    
    [super setFrame:frame];
}

@end
