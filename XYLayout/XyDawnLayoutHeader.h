//
//  XyDawnLayoutHeader.h
//  XyLayout
//
//  Created by apple on 15/11/26.
//  Copyright © 2015年 Xydawn. All rights reserved.
//



//2016.1.21  9:40  解决重复约束
/*
 xy_removeLayout(lay,view,s)移除某个UIView 的某个约束
 举个栗子:
   xy_removeLayout(lay,label3, lay.firstAttribute == NSLayoutAttributeWidth ||
                            lay.firstAttribute == NSLayoutAttributeHeight);
 
 */
/*
 
 
 以下是一些能用到的参数，或方法名的解释
 
 relatedBy:(NSLayoutRelation )relate 确定与约束值的关系
 
 typedef NS_ENUM(NSInteger, NSLayoutRelation) {
 NSLayoutRelationLessThanOrEqual = -1, 小于或等于
 NSLayoutRelationEqual = 0,            等于
 NSLayoutRelationGreaterThanOrEqual = 1,大于或等于
 };
 
 
 withSuperView:(UIView *)superView 没有添加到父视图上,传入父视图并添加（不用担心重复添加，已做处理）
 
 xy_autoMultiplierWith:(CGFloat)multiplier 约束的倍数关系
 
 */

#ifndef XyDawnLayoutHeader_h
#define XyDawnLayoutHeader_h

#import "NSLayoutConstraint+XyLayout.h"
#import "UIView+XyDawnLayout.h"
#import <objc/runtime.h>

#define XY(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define k_width [UIScreen mainScreen].bounds.size.width

#define k_height [UIScreen mainScreen].bounds.size.height


#ifdef DEBUG

#define CHQLog( s, ... ) NSLog( @"<%@:(%d)> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] );

#else

#define CHQLog( s, ... )

#endif

#define xy_addToSuperView(superView)     [superView addSubview:self];  self.translatesAutoresizingMaskIntoConstraints =NO;

#define xy_autolayoutArr(layoutArr)      if (view.superview==nil) {CHQLog(@"父类为空")} NSArray *layoutArr  = nil;

#define xy_autolayoutArrVTV(layoutArr)   if (view2== nil) { CHQLog(@"view2为空")}if (view.superview==nil) {CHQLog(@"view父类为空")}if (view2.superview==nil) {CHQLog(@"view2父类为空")}if (view.superview != view2.superview) {CHQLog(@"view1 与 view2 不在同一界面")} NSArray *layoutArr  = nil;

#define  xy_getSuperView(superView)      UIView *superView = self.superview;

#define xy_lazyValue(s)     BOOL finshesd = (BOOL)objc_getAssociatedObject(self, @"finshesd");if (!finshesd) {objc_setAssociatedObject(self, @"finshesd", @1, OBJC_ASSOCIATION_ASSIGN);xy_addToSuperView(superView) s }else{xy_getSuperView(superView) s }
#define xy_SelflazyValue(s)     BOOL finshesd = (BOOL)objc_getAssociatedObject(self, @"finshesd");if (!finshesd) {objc_setAssociatedObject(self, @"finshesd", @1, OBJC_ASSOCIATION_ASSIGN);xy_addToSuperView(superView) s }else{ s }






#define xy_removeConstraint(lay,s)     \
for (NSLayoutConstraint *lay in view.superview.constraints) {\
if (lay.firstItem == view) {\
    if (s) {\
        [view.superview removeConstraint:lay];\
}\
}\
}

#define xy_removeSelfConstraint(lay,s)     \
for (NSLayoutConstraint *lay in view.constraints) {\
    if (s) {\
        [view removeConstraint:lay];\
    }\
}


#define xy_removeLayout( lay , view , s)     \
for (NSLayoutConstraint *lay in view.constraints) {\
if (s) {\
[view removeConstraint:lay];\
}\
}

#endif /* XyDawnLayoutHeader_h */
