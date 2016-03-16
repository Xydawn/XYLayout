//
//  NSLayoutConstraint+XyLayout.m
//  XyLayout
//
//  Created by apple on 15/11/26.
//  Copyright © 2015年 Xydawn. All rights reserved.
//

#import "NSLayoutConstraint+XyLayout.h"

@implementation NSLayoutConstraint (XyLayout)
#pragma mark -确定在父视图中的范围
+(NSArray *)xy_setEdgeInsetsWith:(UIEdgeInsets)insets withView:(UIView *)view{
    xy_autolayoutArr(layoutArr)
    
    
    
    xy_removeConstraint(lay, lay.firstAttribute == NSLayoutAttributeTop ||
                        lay.firstAttribute == NSLayoutAttributeLeft||
                        lay.firstAttribute == NSLayoutAttributeRight||
                        lay.firstAttribute == NSLayoutAttributeBottom)
    
    
    
    NSLayoutConstraint *xy_top = [NSLayoutConstraint constraintWithItem:view attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:view.superview attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:insets.top];
    
    NSLayoutConstraint *xy_left = [NSLayoutConstraint constraintWithItem:view attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:view.superview attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:insets.left];
    
    NSLayoutConstraint *xy_right = [NSLayoutConstraint constraintWithItem:view attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:view.superview attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:-insets.right];
    
    NSLayoutConstraint *xy_bottom = [NSLayoutConstraint constraintWithItem:view attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:view.superview attribute:(NSLayoutAttributeBottom) multiplier:1.0 constant:-insets.bottom];
    
    
    
    layoutArr = @[xy_top,xy_left,xy_right,xy_bottom];
    
    return layoutArr;
}

+(NSArray *)xy_setEdgeInsetsWith:(UIEdgeInsets)insets withView:(UIView *)view relatedBy:(NSLayoutRelation )related{
    xy_autolayoutArr(layoutArr)
    
    xy_removeConstraint(lay, lay.firstAttribute == NSLayoutAttributeTop ||
                        lay.firstAttribute == NSLayoutAttributeLeft||
                        lay.firstAttribute == NSLayoutAttributeRight||
                        lay.firstAttribute == NSLayoutAttributeBottom)

    
    NSLayoutConstraint *xy_top = [NSLayoutConstraint constraintWithItem:view attribute:(NSLayoutAttributeTop) relatedBy:(related) toItem:view.superview attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:insets.top];
    
    NSLayoutConstraint *xy_left = [NSLayoutConstraint constraintWithItem:view attribute:(NSLayoutAttributeLeft) relatedBy:(related) toItem:view.superview attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:insets.left];
    
    NSLayoutConstraint *xy_right = [NSLayoutConstraint constraintWithItem:view attribute:(NSLayoutAttributeRight) relatedBy:(related) toItem:view.superview attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:-insets.right];
    
    NSLayoutConstraint *xy_bottom = [NSLayoutConstraint constraintWithItem:view attribute:(NSLayoutAttributeBottom) relatedBy:(related) toItem:view.superview attribute:(NSLayoutAttributeBottom) multiplier:1.0 constant:-insets.bottom];
    
    layoutArr = @[xy_top,xy_left,xy_right,xy_bottom];
    
    return layoutArr;
}
#pragma mark - 充满父类
+(NSArray *)xy_setFullWithSupViewWithView:(UIView *)view{
    if (view.superview==nil) {
        CHQLog(@"父类为空")
    }
 
    return [NSLayoutConstraint xy_setEdgeInsetsWith:UIEdgeInsetsMake(0, 0, 0, 0) withView:view];
}

+(NSArray *)xy_setFullWithSupViewWithView:(UIView *)view relatedBy:(NSLayoutRelation )related{
    if (view.superview==nil) {
        CHQLog(@"父类为空")
    }
    
    return [NSLayoutConstraint xy_setEdgeInsetsWith:UIEdgeInsetsMake(0, 0, 0, 0) withView:view relatedBy:related ];
}

#pragma mark -确定Size大小
+(NSArray *)xy_setSizeWith:(CGSize )autoSize with:(UIView *)view{
    xy_autolayoutArr(layoutArr)
    
   
    xy_removeSelfConstraint(lay,lay.firstAttribute == NSLayoutAttributeWidth || lay.firstAttribute == NSLayoutAttributeHeight)

    
    CGFloat width = autoSize.width;
    CGFloat height = autoSize.height;
    
    
    
    
    NSLayoutConstraint *xy_width = [NSLayoutConstraint constraintWithItem:view attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:0 multiplier:0 constant:width];
    NSLayoutConstraint *xy_height = [NSLayoutConstraint constraintWithItem:view attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(0) multiplier:0 constant:height];
    
    layoutArr = @[xy_width,xy_height];
    
    return layoutArr;
}

+(NSArray *)xy_setSizeWith:(CGSize )autoSize with:(UIView *)view relatedBy:(NSLayoutRelation )related{
    xy_autolayoutArr(layoutArr)
    
    xy_removeSelfConstraint(lay,lay.firstAttribute == NSLayoutAttributeWidth || lay.firstAttribute == NSLayoutAttributeHeight)
    
    CGFloat width = autoSize.width;
    CGFloat height = autoSize.height;
    NSLayoutConstraint *xy_width = [NSLayoutConstraint constraintWithItem:view attribute:(NSLayoutAttributeWidth) relatedBy:(related) toItem:nil attribute:0 multiplier:0 constant:width];
    NSLayoutConstraint *xy_height = [NSLayoutConstraint constraintWithItem:view attribute:(NSLayoutAttributeHeight) relatedBy:(related) toItem:nil attribute:(0) multiplier:0 constant:height];
    
    layoutArr = @[xy_width,xy_height];
    
    return layoutArr;
}


#pragma mark - 距离边距的距离

+(NSArray *)xy_setConstantWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute toSuperViewWith:(UIView *)view{
    xy_autolayoutArr(layoutArr)
    
    
     xy_removeConstraint(lay,lay.firstAttribute == attribute)
    
     if ( attribute == NSLayoutAttributeRight||attribute ==NSLayoutAttributeBottom) {
        constant = -constant;
    }
    
    NSLayoutConstraint *xy_attribute = [NSLayoutConstraint addToSuperViewWithView:view WithAttribute:attribute andConstant:constant];
    
    layoutArr = @[xy_attribute];
    
    return layoutArr;
}

+(NSArray *)xy_setConstantWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute toSuperViewWith:(UIView *)view relatedBy:(NSLayoutRelation )related{
    xy_autolayoutArr(layoutArr)
    
     xy_removeConstraint(lay,lay.firstAttribute == attribute)
    
    if ( attribute == NSLayoutAttributeRight||attribute ==NSLayoutAttributeBottom) {
        constant = -constant;
    }
    
    NSLayoutConstraint *xy_attribute = [NSLayoutConstraint addToSuperViewWithView:view WithAttribute:attribute andConstant:constant relatedBy:related];
    
    layoutArr = @[xy_attribute];
    
    return layoutArr;
}

#pragma mark - 确定宽或长
+(NSArray*)xy_setWidthOrHeighWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute with:(UIView *)view{
    xy_autolayoutArr(layoutArr)
     xy_removeSelfConstraint(lay,lay.firstAttribute == attribute)
    
    
      NSLayoutConstraint *xy_width = [NSLayoutConstraint constraintWithItem:view attribute:attribute relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:0 multiplier:0 constant:constant];
    
    
    
    layoutArr = @[xy_width];
    return layoutArr;
}

+(NSArray*)xy_setWidthOrHeighWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute with:(UIView *)view relatedBy:(NSLayoutRelation )related{
    
    
    xy_autolayoutArr(layoutArr)
    
     xy_removeSelfConstraint(lay,lay.firstAttribute == attribute)
    
    NSLayoutConstraint *xy_width = [NSLayoutConstraint constraintWithItem:view attribute:attribute relatedBy:(related) toItem:nil attribute:0 multiplier:0 constant:constant];
    layoutArr = @[xy_width];
    return layoutArr;
}

#pragma makr - 确定与子类控件之间的关系
+(NSArray*)xy_setConstantWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute with:(UIView *)view toOtherView:(UIView *)view2 withAttribute:(NSLayoutAttribute)attribute2{
    xy_autolayoutArrVTV(layoutArr)
   
     xy_removeSelfConstraint(lay,lay.firstAttribute == attribute)
    
    if ( attribute == NSLayoutAttributeRight||attribute ==NSLayoutAttributeBottom) {
        constant = -constant;
    }
    
    NSLayoutConstraint *xy_Att  = [NSLayoutConstraint constraintWithItem:view attribute:attribute relatedBy:(NSLayoutRelationEqual) toItem:view2 attribute:attribute2 multiplier:1.0 constant:constant];
    layoutArr = @[xy_Att];
    return layoutArr;
}

+(NSArray*)xy_setConstantWith:(CGFloat)constant withAttribute:(NSLayoutAttribute)attribute with:(UIView *)view toOtherView:(UIView *)view2 withAttribute:(NSLayoutAttribute)attribute2 relatedBy:(NSLayoutRelation )related{
    xy_autolayoutArrVTV(layoutArr)
    
     xy_removeSelfConstraint(lay,lay.firstAttribute == attribute)
   
    if ( attribute == NSLayoutAttributeRight||attribute ==NSLayoutAttributeBottom) {
        constant = -constant;
    }
    
    NSLayoutConstraint *xy_Att  = [NSLayoutConstraint constraintWithItem:view attribute:attribute relatedBy:(related) toItem:view2 attribute:attribute2 multiplier:1.0 constant:constant];
    layoutArr = @[xy_Att];
    return layoutArr;
}

#pragma mark - 在父类控件中的百分比位置
+(NSArray *)xy_setMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute toSuperViewWith:(UIView *)view{
    xy_autolayoutArr(layoutArr)
    
     xy_removeConstraint(lay,lay.firstAttribute == attribute)
    
    if ( attribute == NSLayoutAttributeRight||attribute ==NSLayoutAttributeBottom) {
        multiplier = -multiplier;
    }
    
    NSLayoutConstraint *xy_multiplier = [NSLayoutConstraint constraintWithItem:view attribute:attribute relatedBy:(NSLayoutRelationEqual) toItem:view.superview attribute:attribute multiplier:multiplier constant:0];
    layoutArr = @[xy_multiplier];
    return layoutArr;
}

+(NSArray *)xy_setMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute toSuperViewWith:(UIView *)view relatedBy:(NSLayoutRelation )related{
    xy_autolayoutArr(layoutArr)
    
     xy_removeConstraint(lay,lay.firstAttribute == attribute)
    
    if ( attribute == NSLayoutAttributeRight||attribute ==NSLayoutAttributeBottom) {
        multiplier = -multiplier;
    }
    NSLayoutConstraint *xy_multiplier = [NSLayoutConstraint constraintWithItem:view attribute:attribute relatedBy:(related) toItem:view.superview attribute:attribute multiplier:multiplier constant:0];
    layoutArr = @[xy_multiplier];
    return layoutArr;
}

#pragma mark - 子类控件等于子类控件长度百分比
+(NSArray *)xy_setMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute withView:(UIView *)view toOtherWith:(UIView *)view2 {
    xy_autolayoutArrVTV(layoutArr)
    
     xy_removeConstraint(lay,lay.firstAttribute == attribute)
    
     if ( attribute == NSLayoutAttributeRight||attribute ==NSLayoutAttributeBottom) {
        multiplier = -multiplier;
    }
    NSLayoutConstraint *xy_multiplier = [NSLayoutConstraint constraintWithItem:view attribute:attribute relatedBy:(NSLayoutRelationEqual) toItem:view2 attribute:attribute multiplier:multiplier constant:0];
    layoutArr = @[xy_multiplier];
    
    return layoutArr;
    
}

+(NSArray *)xy_setMultiplierWith:(CGFloat)multiplier withAttribute:(NSLayoutAttribute)attribute withView:(UIView *)view toOtherWith:(UIView *)view2 relatedBy:(NSLayoutRelation )related{
    xy_autolayoutArrVTV(layoutArr)
    
    
     xy_removeConstraint(lay,lay.firstAttribute == attribute)
    
    if ( attribute == NSLayoutAttributeRight||attribute ==NSLayoutAttributeBottom) {
        multiplier = -multiplier;
    }
    NSLayoutConstraint *xy_multiplier = [NSLayoutConstraint constraintWithItem:view attribute:attribute relatedBy:(related) toItem:view2 attribute:attribute multiplier:multiplier constant:0];
    layoutArr = @[xy_multiplier];
    
    return layoutArr;
    
}
#pragma mark - 与父类控件两端对齐
+(NSArray *)xy_setFullJustifiedWithSupViewAndView:(UIView *)view{
    xy_autolayoutArr(layoutArr)
    
     xy_removeConstraint(lay,lay.firstAttribute == NSLayoutAttributeRight||lay.firstAttribute == NSLayoutAttributeLeft)
    
    NSLayoutConstraint *xy_right = [NSLayoutConstraint constraintWithItem:view attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:view.superview attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:0  ];
        NSLayoutConstraint *xy_left = [NSLayoutConstraint constraintWithItem:view attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:view.superview attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:0  ];
    layoutArr = @[xy_right,xy_left];
    return layoutArr ;
}

+(NSArray *)xy_setFullJustifiedWithSupViewAndView:(UIView *)view relatedBy:(NSLayoutRelation )related{
    xy_autolayoutArr(layoutArr)
    
    xy_removeConstraint(lay,lay.firstAttribute == NSLayoutAttributeRight||lay.firstAttribute == NSLayoutAttributeLeft)
    
    NSLayoutConstraint *xy_right = [NSLayoutConstraint constraintWithItem:view attribute:(NSLayoutAttributeRight) relatedBy:(related) toItem:view.superview attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:0  ];
    NSLayoutConstraint *xy_left = [NSLayoutConstraint constraintWithItem:view attribute:(NSLayoutAttributeLeft) relatedBy:(related) toItem:view.superview attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:0  ];
    layoutArr = @[xy_right,xy_left];
    return layoutArr ;
}


#pragma mark - End

#pragma mark - 上面调用时已经解决重复约束问题，下列方法无需修改
+(NSLayoutConstraint *)addToSuperViewWithView:(UIView *)view WithAttribute:(NSLayoutAttribute)attr andConstant:(CGFloat)constant{
    return [NSLayoutConstraint constraintWithItem:view attribute:attr relatedBy:(NSLayoutRelationEqual) toItem:view.superview attribute:attr multiplier:1.0 constant:constant];
}

+(NSLayoutConstraint *)addToSuperViewWithView:(UIView *)view WithAttribute:(NSLayoutAttribute)attr andConstant:(CGFloat)constant relatedBy:(NSLayoutRelation )related{
    return [NSLayoutConstraint constraintWithItem:view attribute:attr relatedBy:(related) toItem:view.superview attribute:attr multiplier:1.0 constant:constant];
}

@end
