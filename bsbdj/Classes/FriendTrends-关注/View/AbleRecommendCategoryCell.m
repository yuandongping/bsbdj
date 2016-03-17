//
//  AbleRecommendCategoryCell.m
//  bsbdj
//
//  Created by 袁冬平 on 16/3/15.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import "AbleRecommendCategoryCell.h"
#import "AbleRecommendcategory.h"

@interface AbleRecommendCategoryCell()
@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;

@end


@implementation AbleRecommendCategoryCell

- (void)awakeFromNib {
//    self.textLabel.font = [UIFont systemFontOfSize: 14.0];
    self.backgroundColor = AbleRGBColor(255, 255, 255);
    self.selectedIndicator.backgroundColor = AbleRGBColor(219, 21, 26);
    
    //当cell的selection为None时，即使cell被选中了，内部的字控件也不会进入高亮状态
//    self.textLabel.textColor = AbleRGBColor(78, 78, 78);
//    self.textLabel.highlightedTextColor = AbleRGBColor(219, 21, 26);
    
//    UIView *bg = [[UIView alloc] init];
//    bg.backgroundColor = [UIColor clearColor];
//    self.selectedBackgroundView = bg;
}

- (void) setCategory:(AbleRecommendCategory *)category
{
    _category = category;
    self.textLabel.text = category.name;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    //重新调整textLabel的frame
    self.textLabel.y = 1;
    self.textLabel.height = self.contentView.height-2*self.textLabel.y;
}

//可以在这个方法中监听cel的选中和取消选中
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
//    AbleLog(@"%@====%d", self.category.name, selected);
    self.selectedIndicator.hidden = !selected;
    self.textLabel.textColor = selected ? self.selectedIndicator.backgroundColor : AbleRGBColor(78, 78, 78);
}


@end
