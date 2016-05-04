//
//  UITableViewCell+SetImageSize.m
//  QinDianSheQu
//
//  Created by 金斗云 on 16/3/7.
//  Copyright © 2016年 Xydawn. All rights reserved.
//

#import "UIImageView+SetImageSize.h"
#import "EMSDWebImageCompat.h"
#import "EMSDWebImageManager.h"
#import "UIImageView+EMWebCache.h"
#import "UIView+EMWebCacheOperation.h"
#import "XyDawnLayoutHeader.h"
static char imageURLKey;

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

/*
 __weak UIImageView *wself = self;
 id <EMSDWebImageOperation> operation = [EMSDWebImageManager.sharedManager downloadImageWithURL:url options:options progress:progressBlock completed:^(UIImage *image, NSError *error, EMSDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
 if (!wself) return;
 dispatch_main_sync_safe(^{
 if (!wself) return;
 if (image) {
 wself.image = image;
 [wself setNeedsLayout];
 } else {
 if ((options & EMSDWebImageDelayPlaceholder)) {
 wself.image = placeholder;
 [wself setNeedsLayout];
 }
 }
 if (completedBlock && finished) {
 completedBlock(image, error, cacheType, url);
 }
 });
 }];
 [self sd_setImageLoadOperation:operation forKey:@"UIImageViewImageLoad"];

 */

-(void)xy_setImageViewWithSize:(CGSize )size andImage:(UIImage *)image{
    UIGraphicsBeginImageContextWithOptions(size, NO,0.0);
    CGRect imageRect = CGRectMake(0.0, 0.0, size.width, size.height);
    [image drawInRect:imageRect];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
}


-(void)xy_setImageViewWithSize:(CGSize )size andURL:(NSURL *)url andplaceholder:(UIImage *)placeholder{
    
    [self sd_cancelCurrentImageLoad];
    objc_setAssociatedObject(self, &imageURLKey, url, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (!(0 & EMSDWebImageDelayPlaceholder)) {
        self.image = placeholder;
    }
    
    __weak UIImageView *wself = self;
    id <EMSDWebImageOperation> operation = [EMSDWebImageManager.sharedManager downloadImageWithURL:url options:0 progress:nil completed:^(UIImage *image, NSError *error, EMSDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (!wself) return;
        dispatch_main_sync_safe(^{
            if (!wself) return;
            if (image) {
                UIGraphicsBeginImageContextWithOptions(size, NO,0.0);
                CGRect imageRect = CGRectMake(0.0, 0.0, size.width, size.height);
                [image drawInRect:imageRect];
                wself.image = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
            } else {
                if ((0 &EMSDWebImageDelayPlaceholder)) {
                    
                    wself.image = placeholder;
                    [wself setNeedsLayout];
                }
            }
        });
    }];
    [self sd_setImageLoadOperation:operation forKey:@"UIImageViewImageLoad"];
}





@end
