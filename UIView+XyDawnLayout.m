//
//  UIView+XyDawnLayout.m
//  XyLayout
//
//  Created by apple on 15/11/26.
//  Copyright © 2015年 Xydawn. All rights reserved.
//

#import "UIView+XyDawnLayout.h"
#import <objc/runtime.h>
@implementation UIView (XyDawnLayout)
#pragma mark -确定Size大小

-(void)xy_autoLayoutSetSize:(CGSize )autoSize{
    
    /*
        xy_getSuperView(superView) 代表下列

        UIView *superView = self.superview;
     */
    
    xy_getSuperView(superView)
    [superView addConstraints:[NSLayoutConstraint xy_setSizeWith:autoSize with:self]];
}

-(void)xy_autoLayoutSetSize:(CGSize )autoSize relatedBy:(NSLayoutRelation )related{
    xy_getSuperView(superView)
    [superView addConstraints:[NSLayoutConstraint xy_setSizeWith:autoSize with:self relatedBy:related] ];
}

-(void)xy_autoLayoutSetSize:(CGSize)autoSize withSuperView:(UIView *)superView{
 
  
  
    /*
    xy_lazyValue 这个宏  代表下列 
     
    BOOL finshesd = objc_getAssociatedObject(self, @"finshesd");
    
    if (!finshesd) {objc_setAssociatedObject(self, @"finshesd", @1, OBJC_ASSOCIATION_ASSIGN);
        
        ||
        xy_addToSuperView(superView) 代表以下
     
       [superView addSubview:self];  self.translatesAutoresizingMaskIntoConstraints =NO;
        ||
     
        xy_addToSuperView(superView)  [superView addConstraints:[NSLayoutConstraint xy_setSizeWith:autoSize with:self]];
        
    }else{
        
        xy_getSuperView(superView)  [superView addConstraints:[NSLayoutConstraint xy_setSizeWith:autoSize with:self]];
        
    }
     */
    xy_lazyValue([superView addConstraints:[NSLayoutConstraint xy_setSizeWith:autoSize with:self]];)
    
                
   
}

-(void)xy_autoLayoutSetSize:(CGSize)autoSize withSuperView:(UIView *)superView relatedBy:(NSLayoutRelation )related{
    
    xy_lazyValue([superView addConstraints:[NSLayoutConstraint xy_setSizeWith:autoSize with:self relatedBy:related]];)
    
    
    
}

#pragma mark - 确定Size大小End
#pragma mark -确定在父视图中的范围
//确定范围
-(void)xy_autoLayoutSetEdgeInsets:(UIEdgeInsets)insets{
    UIView *superView = self.superview;

    [superView addConstraints:[NSLayoutConstraint xy_setEdgeInsetsWith:insets withView:self]];
}

-(void)xy_autoLayoutSetEdgeInsets:(UIEdgeInsets)insets relatedBy:(NSLayoutRelation )related{
    UIView *superView = self.superview;
    
    [superView addConstraints:[NSLayoutConstraint xy_setEdgeInsetsWith:insets withView:self relatedBy:related]];
}

-(void)xy_autoLayoutSetEdgeInsets:(UIEdgeInsets)insets withSuperView:(UIView *)superView{
    
    xy_lazyValue([superView addConstraints:[NSLayoutConstraint xy_setEdgeInsetsWith:insets withView:self]];)
}

-(void)xy_autoLayoutSetEdgeInsets:(UIEdgeInsets)insets withSuperView:(UIView *)superView relatedBy:(NSLayoutRelation )related{
    
    xy_lazyValue([superView addConstraints:[NSLayoutConstraint xy_setEdgeInsetsWith:insets withView:self relatedBy:related]];)
}


#pragma mark -确定在父视图中的范围End
#pragma mark - 充满父类
-(void)xy_autoFullSupView{
    xy_getSuperView(superView)
    [superView addConstraints:[NSLayoutConstraint xy_setFullWithSupViewWithView:self]];
}

-(void)xy_autoFullSupViewRelatedBy:(NSLayoutRelation )related{
    xy_getSuperView(superView)
    [superView addConstraints:[NSLayoutConstraint xy_setFullWithSupViewWithView:self relatedBy:related]];
}

-(void)xy_autoFullSupViewWith:(UIView *)superView{
    xy_lazyValue( [superView addConstraints:[NSLayoutConstraint xy_setFullWithSupViewWithView:self]];)
}

-(void)xy_autoFullSupViewWith:(UIView *)superView relatedBy:(NSLayoutRelation )related{
    xy_lazyValue( [superView addConstraints:[NSLayoutConstraint xy_setFullWithSupViewWithView:self relatedBy:related]];)
}

#pragma mark - 充满父类End
#pragma mark - 距离边距的距离
-(void)xy_autoConstantToSuperWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute{
    xy_getSuperView(superView)
   
    
    [superView addConstraints:[NSLayoutConstraint xy_setConstantWith:constant withAttribute:attribute toSuperViewWith:self]];
}

-(void)xy_autoConstantToSuperWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute relatedBy:(NSLayoutRelation )related{
    xy_getSuperView(superView)
    [superView addConstraints:[NSLayoutConstraint xy_setConstantWith:constant withAttribute:attribute toSuperViewWith:self relatedBy:related]];
}

-(void)xy_autoConstantToSuperWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute withSuperView:(UIView *)superView{
    xy_addToSuperView(superView)
    [superView addConstraints:[NSLayoutConstraint xy_setConstantWith:constant withAttribute:attribute toSuperViewWith:self]];
}

-(void)xy_autoConstantToSuperWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute withSuperView:(UIView *)superView relatedBy:(NSLayoutRelation )related{
    xy_addToSuperView(superView)
    [superView addConstraints:[NSLayoutConstraint xy_setConstantWith:constant withAttribute:attribute toSuperViewWith:self relatedBy:related]];
}

#pragma mark -距离边距的距离End


#pragma mark - 确定宽或长
-(void)xy_autoWidthOrHeighWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute{
    xy_getSuperView(superView)
 
    [superView addConstraints:[NSLayoutConstraint  xy_setWidthOrHeighWith:constant withAttribute:attribute with:self]];
}

-(void)xy_autoWidthOrHeighWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute relatedBy:(NSLayoutRelation )relate{
    xy_getSuperView(superView)
    [superView addConstraints:[NSLayoutConstraint  xy_setWidthOrHeighWith:constant withAttribute:attribute with:self relatedBy:relate]];
}

-(void)xy_autoWidthOrHeighWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute WithSuperView:(UIView *)superView{
    xy_lazyValue([superView addConstraints:[NSLayoutConstraint  xy_setWidthOrHeighWith:constant withAttribute:attribute with:self]];)

}

-(void)xy_autoWidthOrHeighWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute WithSuperView:(UIView *)superView relatedBy:(NSLayoutRelation )relate{
    xy_lazyValue([superView addConstraints:[NSLayoutConstraint  xy_setWidthOrHeighWith:constant withAttribute:attribute with:self relatedBy:relate]];)
    
}
#pragma mark - 确定宽或长End


#pragma makr - 确定与子类控件之间的关系
-(void)xy_autoConstantWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute toOtherView:(UIView *)view2 withAttribute:(NSLayoutAttribute)attribute2{
    xy_getSuperView(superView)
    
   
    
    [superView addConstraints:[NSLayoutConstraint xy_setConstantWith:constant withAttribute:attribute with:self toOtherView:view2 withAttribute:attribute2]];
}

-(void)xy_autoConstantWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute toOtherView:(UIView *)view2 withAttribute:(NSLayoutAttribute)attribute2 relatedBy:(NSLayoutRelation )relate{
    xy_getSuperView(superView)
    [superView addConstraints:[NSLayoutConstraint xy_setConstantWith:constant withAttribute:attribute with:self toOtherView:view2 withAttribute:attribute2 relatedBy:relate]];
}

-(void)xy_autoConstantWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute toOtherView:(UIView *)view2 withAttribute:(NSLayoutAttribute)attribute2 withSupview:(UIView *)superView{
    xy_lazyValue(  [superView addConstraints:[NSLayoutConstraint xy_setConstantWith:constant withAttribute:attribute with:self toOtherView:view2 withAttribute:attribute2]];)
}

-(void)xy_autoConstantWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute toOtherView:(UIView *)view2 withAttribute:(NSLayoutAttribute)attribute2 withSupview:(UIView *)superView relatedBy:(NSLayoutRelation )relate{
    xy_lazyValue(  [superView addConstraints:[NSLayoutConstraint xy_setConstantWith:constant withAttribute:attribute with:self toOtherView:view2 withAttribute:attribute2 relatedBy:relate]];)
}
#pragma makr - 确定与子类控件之间的关系End

#pragma mark - 在父类控件中的百分比位置
-(void)xy_autoMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute{
    xy_getSuperView(superView)
    [superView addConstraints:[NSLayoutConstraint xy_setMultiplierWith:multiplier withAttribute:attribute toSuperViewWith:self]];
}

-(void)xy_autoMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute relatedBy:(NSLayoutRelation )relate{
    xy_getSuperView(superView)
    [superView addConstraints:[NSLayoutConstraint xy_setMultiplierWith:multiplier withAttribute:attribute toSuperViewWith:self relatedBy:relate]];
}

-(void)xy_autoMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute toSuperViewWith:(UIView *)superView{
    xy_lazyValue( [superView addConstraints:[NSLayoutConstraint xy_setMultiplierWith:multiplier withAttribute:attribute toSuperViewWith:self]];)
}

-(void)xy_autoMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute toSuperViewWith:(UIView *)superView relatedBy:(NSLayoutRelation )relate{
    xy_lazyValue( [superView addConstraints:[NSLayoutConstraint xy_setMultiplierWith:multiplier withAttribute:attribute toSuperViewWith:self relatedBy:relate]];)
}
#pragma mark - 在父类控件中的百分比位置End

#pragma mark - 子类控件等于子类控件长度百分比
-(void)xy_autoMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute toOtherWith:(UIView *)view2{
    xy_getSuperView(superView)
    [superView addConstraints:[NSLayoutConstraint xy_setMultiplierWith:multiplier withAttribute:attribute withView:self toOtherWith:view2 ]];
}

-(void)xy_autoMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute toOtherWith:(UIView *)view2 relatedBy:(NSLayoutRelation )relate{
    xy_getSuperView(superView)
    [superView addConstraints:[NSLayoutConstraint xy_setMultiplierWith:multiplier withAttribute:attribute withView:self toOtherWith:view2 relatedBy:relate]];
}

-(void)xy_autoMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute toOtherWith:(UIView *)view2 withSupview:(UIView *)superView{
    xy_lazyValue([superView addConstraints:[NSLayoutConstraint xy_setMultiplierWith:multiplier withAttribute:attribute withView:self toOtherWith:view2 ]];)
}

-(void)xy_autoMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute toOtherWith:(UIView *)view2 withSupview:(UIView *)superView relatedBy:(NSLayoutRelation )relate{
    xy_lazyValue([superView addConstraints:[NSLayoutConstraint xy_setMultiplierWith:multiplier withAttribute:attribute withView:self toOtherWith:view2  relatedBy:relate]];)
}

#pragma mark - 子类控件等于子类控件长度百分比End
#pragma mark - 与父类控件两端对齐
-(void)xy_autoFullJustifiedToSupViewRelatedBy:(NSLayoutRelation )related{
    xy_getSuperView(superView)
    [superView addConstraints:[NSLayoutConstraint xy_setFullJustifiedWithSupViewAndView:self relatedBy:related]];
}
-(void)xy_autoFullJustifiedWithSupView:(UIView *)superView RelatedBy:(NSLayoutRelation )related{
   xy_lazyValue([superView addConstraints:[NSLayoutConstraint xy_setFullJustifiedWithSupViewAndView:self relatedBy:related]];)
}

-(void)xy_autoFullJustifiedToSupView{
    xy_getSuperView(superView)
    [superView addConstraints:[NSLayoutConstraint xy_setFullJustifiedWithSupViewAndView:self]];
}
-(void)xy_autoFullJustifiedWithSupView:(UIView *)superView{
    xy_lazyValue([superView addConstraints:[NSLayoutConstraint xy_setFullJustifiedWithSupViewAndView:self]];)

}
#pragma mark - 与父类控件两端对齐End
@end
