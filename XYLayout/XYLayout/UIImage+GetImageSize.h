//
//  UIImage+GetImageSize.h
//  QinDianSheQu
//
//  Created by 曹操 on 16/4/12.
//  Copyright © 2016年 Xydawn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GetImageSize)

+(UIImage *)xy_getImageViewWithSize:(CGSize )size andImageName:(NSString *)name;

+(UIImage *)xy_getImageViewWithSize:(CGSize )size andImageData:(NSData *)data;

+(UIImage *)xy_getImageViewWithSize:(CGSize )size andImage:(UIImage *)image;

@end
