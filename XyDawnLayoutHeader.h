//
//  XyDawnLayoutHeader.h
//  XyLayout
//
//  Created by apple on 15/11/26.
//  Copyright © 2015年 Xydawn. All rights reserved.
//

#ifndef XyDawnLayoutHeader_h
#define XyDawnLayoutHeader_h

#import "NSLayoutConstraint+XyLayout.h"
#import "UIView+XyDawnLayout.h"

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

#define xy_lazyValue(s)     BOOL finshesd = objc_getAssociatedObject(self, @"finshesd");if (!finshesd) {objc_setAssociatedObject(self, @"finshesd", @1, OBJC_ASSOCIATION_ASSIGN);xy_addToSuperView(superView) s }else{xy_getSuperView(superView) s }

#endif /* XyDawnLayoutHeader_h */
