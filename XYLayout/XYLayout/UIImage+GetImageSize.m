//
//  UIImage+GetImageSize.m
//  QinDianSheQu
//
//  Created by 曹操 on 16/4/12.
//  Copyright © 2016年 Xydawn. All rights reserved.
//

#import "UIImage+GetImageSize.h"

@implementation UIImage (GetImageSize)
+(UIImage *)xy_getImageViewWithSize:(CGSize )size andImageName:(NSString *)name{
    
    
    UIGraphicsBeginImageContextWithOptions(size, NO,0.0);
    CGRect imageRect = CGRectMake(0.0, 0.0, size.width, size.height);
    [[UIImage imageNamed:name] drawInRect:imageRect];
    
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}


+(UIImage *)xy_getImageViewWithSize:(CGSize )size andImageData:(NSData *)data{
    UIGraphicsBeginImageContextWithOptions(size, NO,0.0);
    CGRect imageRect = CGRectMake(0.0, 0.0, size.width, size.height);
    [[UIImage imageWithData:data] drawInRect:imageRect];
    
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}



+(UIImage *)xy_getImageViewWithSize:(CGSize )size andImage:(UIImage *)image{
    UIGraphicsBeginImageContextWithOptions(size, NO,0.0);
    CGRect imageRect = CGRectMake(0.0, 0.0, size.width, size.height);
    [image drawInRect:imageRect];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}

@end
