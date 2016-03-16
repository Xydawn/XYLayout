//
//  UILabel+XyLayout.h
//  QinDianSheQu
//
//  Created by 金斗云 on 16/3/16.
//  Copyright © 2016年 Xydawn. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger) {
    XyLayoutStyleHorizontal = 0,
    XyLayoutStyleVertical
}XyLayoutStyle;
@interface UILabel (XyLayout)

-(void)xy_autoLayoutSetSizeWithStringAndStyle:(XyLayoutStyle )style;

-(void)xy_autoLayoutSetSizeWithStringAndStyle:(XyLayoutStyle)style toSuperView:(UIView *)view;

@end
