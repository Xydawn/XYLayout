//
//  UILabel+XyLayout.m
//  QinDianSheQu
//
//  Created by 金斗云 on 16/3/16.
//  Copyright © 2016年 Xydawn. All rights reserved.
//

#import "UILabel+XyLayout.h"
#import "XyDawnLayoutHeader.h"
@implementation UILabel (XyLayout)
#pragma mark - 根据文字内容自动适配大小
-(void)xy_autoLayoutSetSizeWithStringAndStyle:(XyLayoutStyle)style{
    
    CGSize labelSize = style == XyLayoutStyleHorizontal?CGSizeMake(MAXFLOAT, self.font.lineHeight):CGSizeMake( self.font.lineHeight,MAXFLOAT);
    
    [self xy_autoLayoutSetSize:[self.text xy_stringSizeWithFont:self.font Size:labelSize]];
}

-(void)xy_autoLayoutSetSizeWithStringAndStyle:(XyLayoutStyle)style toSuperView:(UIView *)view{
    
    CGSize labelSize = style == XyLayoutStyleHorizontal?CGSizeMake(MAXFLOAT, self.font.lineHeight):CGSizeMake( self.font.lineHeight,MAXFLOAT);
    
    [self xy_autoLayoutSetSize:[self.text xy_stringSizeWithFont:self.font Size:labelSize] withSuperView:view];
}

#pragma mark - 根据文字内容自动适配大小End
@end
