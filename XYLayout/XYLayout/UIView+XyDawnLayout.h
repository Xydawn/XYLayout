//
//  UIView+XyDawnLayout.h
//  XyLayout
//
//  Created by apple on 15/11/26.
//  Copyright © 2015年 Xydawn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XyDawnLayoutHeader.h"


@interface UIView (XyDawnLayout)
#pragma mark - 确定大小
-(void)xy_autoLayoutSetSize:(CGSize )autoSize;

-(void)xy_autoLayoutSetSize:(CGSize )autoSize relatedBy:(NSLayoutRelation )related;

-(void)xy_autoLayoutSetSize:(CGSize)autoSize withSuperView:(UIView *)superView;

-(void)xy_autoLayoutSetSize:(CGSize)autoSize withSuperView:(UIView *)superView relatedBy:(NSLayoutRelation )related;

#pragma mark - 距离父类控件的范围
-(void)xy_autoLayoutSetEdgeInsets:(UIEdgeInsets)insets;

-(void)xy_autoLayoutSetEdgeInsets:(UIEdgeInsets)insets relatedBy:(NSLayoutRelation )related;

-(void)xy_autoLayoutSetEdgeInsets:(UIEdgeInsets)insets withSuperView:(UIView *)superView;

-(void)xy_autoLayoutSetEdgeInsets:(UIEdgeInsets)insets withSuperView:(UIView *)superView relatedBy:(NSLayoutRelation )related;
#pragma mark - 距离边距的距离
-(void)xy_autoConstantToSuperWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute;

-(void)xy_autoConstantToSuperWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute relatedBy:(NSLayoutRelation )related;

-(void)xy_autoConstantToSuperWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute withSuperView:(UIView *)superView;

-(void)xy_autoConstantToSuperWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute withSuperView:(UIView *)superView relatedBy:(NSLayoutRelation )related;

#pragma mark - 确定宽或长
-(void)xy_autoWidthOrHeighWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute;

-(void)xy_autoWidthOrHeighWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute relatedBy:(NSLayoutRelation )relate;

-(void)xy_autoWidthOrHeighWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute WithSuperView:(UIView *)superView;

-(void)xy_autoWidthOrHeighWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute WithSuperView:(UIView *)superView relatedBy:(NSLayoutRelation )relate;
#pragma mark - 充满父类
-(void)xy_autoFullSupView;

-(void)xy_autoFullSupViewRelatedBy:(NSLayoutRelation )related;

-(void)xy_autoFullSupViewWith:(UIView *)superView;

-(void)xy_autoFullSupViewWith:(UIView *)superView relatedBy:(NSLayoutRelation )related;

#pragma makr - 确定与子类控件之间的关系
-(void)xy_autoConstantWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute toOtherView:(UIView *)view2 withAttribute:(NSLayoutAttribute)attribute2;

-(void)xy_autoConstantWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute toOtherView:(UIView *)view2 withAttribute:(NSLayoutAttribute)attribute2 relatedBy:(NSLayoutRelation )relate;

-(void)xy_autoConstantWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute toOtherView:(UIView *)view2 withAttribute:(NSLayoutAttribute)attribute2 withSupview:(UIView *)superView;

-(void)xy_autoConstantWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute toOtherView:(UIView *)view2 withAttribute:(NSLayoutAttribute)attribute2 withSupview:(UIView *)superView relatedBy:(NSLayoutRelation )relate;

#pragma mark - 在父类控件中的百分比位置
-(void)xy_autoMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute;

-(void)xy_autoMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute relatedBy:(NSLayoutRelation )relate;

-(void)xy_autoMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute toSuperViewWith:(UIView *)superView;

-(void)xy_autoMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute toSuperViewWith:(UIView *)superView relatedBy:(NSLayoutRelation )relate;

#pragma mark - 子类控件等于子类控件长度百分比
-(void)xy_autoMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute toOtherWith:(UIView *)view2;

-(void)xy_autoMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute toOtherWith:(UIView *)view2 relatedBy:(NSLayoutRelation )relate;

-(void)xy_autoMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute toOtherWith:(UIView *)view2 withSupview:(UIView *)superView;

-(void)xy_autoMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute toOtherWith:(UIView *)view2 withSupview:(UIView *)superView relatedBy:(NSLayoutRelation )relate;

#pragma mark - 与父类控件两端对齐
-(void)xy_autoFullJustifiedToSupViewRelatedBy:(NSLayoutRelation )related;

-(void)xy_autoFullJustifiedWithSupView:(UIView *)superView RelatedBy:(NSLayoutRelation )related;

-(void)xy_autoFullJustifiedToSupView;

-(void)xy_autoFullJustifiedWithSupView:(UIView *)superView;

@end
