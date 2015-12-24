//
//  NSLayoutConstraint+XyLayout.h
//  XyLayout
//
//  Created by apple on 15/11/26.
//  Copyright © 2015年 Xydawn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XyDawnLayoutHeader.h"
@interface NSLayoutConstraint (XyLayout)
#pragma mark - 距离边距的距离
+(NSArray *)xy_setConstantWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute toSuperViewWith:(UIView *)view;

+(NSArray *)xy_setConstantWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute toSuperViewWith:(UIView *)view relatedBy:(NSLayoutRelation )related;
#pragma mark -确定Size大小
+(NSArray *)xy_setSizeWith:(CGSize )autoSize with:(UIView *)view;

+(NSArray *)xy_setSizeWith:(CGSize )autoSize with:(UIView *)view relatedBy:(NSLayoutRelation )related;

#pragma mark -确定在父视图中的范围
+(NSArray *)xy_setEdgeInsetsWith:(UIEdgeInsets)insets withView:(UIView *)view;

+(NSArray *)xy_setEdgeInsetsWith:(UIEdgeInsets)insets withView:(UIView *)view relatedBy:(NSLayoutRelation )related;

#pragma mark - 充满父类
+(NSArray *)xy_setFullWithSupViewWithView:(UIView *)view;

+(NSArray *)xy_setFullWithSupViewWithView:(UIView *)view relatedBy:(NSLayoutRelation )related;

#pragma mark - 确定宽或长
+(NSArray*)xy_setWidthOrHeighWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute with:(UIView *)view;

+(NSArray*)xy_setWidthOrHeighWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute with:(UIView *)view relatedBy:(NSLayoutRelation )related;

#pragma makr - 确定与子类控件之间的关系
+(NSArray*)xy_setConstantWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute with:(UIView *)view toOtherView:(UIView *)view2 withAttribute:(NSLayoutAttribute)attribute2;

+(NSArray*)xy_setConstantWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute with:(UIView *)view toOtherView:(UIView *)view2 withAttribute:(NSLayoutAttribute)attribute2 relatedBy:(NSLayoutRelation )related;
#pragma mark - 在父类控件中的百分比位置
+(NSArray *)xy_setMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute toSuperViewWith:(UIView *)view;

+(NSArray *)xy_setMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute toSuperViewWith:(UIView *)view relatedBy:(NSLayoutRelation )related;
#pragma mark - 子类控件等于子类控件长度百分比
+(NSArray *)xy_setMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute withView:(UIView *)view toOtherWith:(UIView *)view2;

+(NSArray *)xy_setMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute withView:(UIView *)view toOtherWith:(UIView *)view2 relatedBy:(NSLayoutRelation )related;

#pragma mark - 与父类控件两端对齐
+(NSArray *)xy_setFullJustifiedWithSupViewAndView:(UIView *)view;

+(NSArray *)xy_setFullJustifiedWithSupViewAndView:(UIView *)view relatedBy:(NSLayoutRelation )related;
@end
