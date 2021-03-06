//
//  UIView+AbleExtension.m
//  budejie
//
//  Created by 袁冬平 on 16/3/8.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import "UIView+AbleExtension.h"

@implementation UIView (AbleExtension)

//size
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
-(CGSize) size
{
    return  self.frame.size;
}

//width
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)width
{
    return self.frame.size.width;
}

//height
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGFloat) height
{
    return self.frame.size.height;
}

//x
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (CGFloat) x
{
    return self.frame.origin.x;
}

//y
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat) y
{
    return self.frame.origin.y;
}

@end
