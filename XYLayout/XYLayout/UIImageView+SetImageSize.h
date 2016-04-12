//
//  UITableViewCell+SetImageSize.h
//  QinDianSheQu
//
//  Created by 金斗云 on 16/3/7.
//  Copyright © 2016年 Xydawn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SetImageSize)

-(void)xy_setImageViewWithSize:(CGSize )size andImageName:(NSString *)name;

-(void)xy_setImageViewWithSize:(CGSize )size andImageData:(NSData *)data;

-(void)xy_setImageViewWithSize:(CGSize )size andImage:(UIImage *)image;



-(void)xy_setImageViewWithSize:(CGSize )size andURL:(NSURL *)url andplaceholder:(UIImage *)placeholder;
/*
     [cell.imageView xy_setImageViewWithSize:CGSizeMake(45, 45) andURL:[NSURL URLWithString:user.imageURL] andplaceholder:[UIImageView xy_getImageViewWithSize:CGSizeMake(45, 45) andImage:[UIImage imageNamed:@"iconfont-touxiang"]]];
 */
@end
