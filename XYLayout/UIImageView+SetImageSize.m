//
//  UITableViewCell+SetImageSize.m
//  QinDianSheQu
//
//  Created by 金斗云 on 16/3/7.
//  Copyright © 2016年 Xydawn. All rights reserved.
//

#import "UIImageView+SetImageSize.h"

@implementation UIImageView (SetImageSize)

-(void)xy_setImageViewWithSize:(CGSize )size andImageName:(NSString *)name{
    

    UIGraphicsBeginImageContextWithOptions(size, NO,0.0);
    CGRect imageRect = CGRectMake(0.0, 0.0, size.width, size.height);
    [[UIImage imageNamed:name] drawInRect:imageRect];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    

}


-(void)xy_setImageViewWithSize:(CGSize )size andImageData:(NSData *)data{
    UIGraphicsBeginImageContextWithOptions(size, NO,0.0);
    CGRect imageRect = CGRectMake(0.0, 0.0, size.width, size.height);
    [[UIImage imageWithData:data] drawInRect:imageRect];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
}



-(void)xy_setImageViewWithSize:(CGSize )size andImage:(UIImage *)image{
    UIGraphicsBeginImageContextWithOptions(size, NO,0.0);
    CGRect imageRect = CGRectMake(0.0, 0.0, size.width, size.height);
    [image drawInRect:imageRect];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
}


@end
