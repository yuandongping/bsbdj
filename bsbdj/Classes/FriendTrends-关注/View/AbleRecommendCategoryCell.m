//
//  AbleRecommendCategoryCell.m
//  bsbdj
//
//  Created by 袁冬平 on 16/3/15.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import "AbleRecommendCategoryCell.h"
#import "AbleRecommendcategory.h"

@implementation AbleRecommendCategoryCell

- (void)awakeFromNib {
    self.backgroundColor = AbleRGBColor(244, 244, 244);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setCategory:(AbleRecommendCategory *)category
{
    _category = category;
    self.textLabel.text = category.name;
}

@end
