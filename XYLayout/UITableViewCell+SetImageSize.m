//
//  UITableViewCell+SetImageSize.m
//  QinDianSheQu
//
//  Created by 金斗云 on 16/3/7.
//  Copyright © 2016年 Xydawn. All rights reserved.
//

#import "UITableViewCell+SetImageSize.h"

@implementation UITableViewCell (SetImageSize)

-(void)setImageViewWithSize:(CGSize )size andUrlString:(NSString *)url ReloadWithTableview:(UITableView *)tableView{
    XY(weakSelf)
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data) {
                weakSelf.imageView.backgroundColor = kBackGroundColor;
                weakSelf.imageView.layer.cornerRadius = 2.5f;
                weakSelf.imageView.layer.masksToBounds = YES;
                UIImage *icon = [UIImage imageWithData:data];
                UIGraphicsBeginImageContextWithOptions(size, NO,0.0);
                CGRect imageRect = CGRectMake(0.0, 0.0, size.width, size.height);
                [icon drawInRect:imageRect];
                weakSelf.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                static dispatch_once_t onceToken;
                dispatch_once(&onceToken, ^{
                    [tableView reloadData];
                });
                
            }
        });
    });

}
@end
