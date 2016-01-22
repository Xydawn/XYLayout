//
//  ViewController.m
//  XyLayout
//
//  Created by apple on 16/1/21.
//  Copyright © 2016年 Xydawn. All rights reserved.
//

#import "XyLayoutViewController.h"
#import "XyDawnLayoutHeader.h"
@interface XyLayoutViewController ()

@end

@implementation XyLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *label = [[UILabel alloc]init];
    [label xy_autoFullSupViewWith:self.view];
    label.backgroundColor = [UIColor blueColor];
    [label xy_autoFullSupViewWith:self.view];
    [label xy_autoLayoutSetSize:CGSizeMake(50, 50)];
    [label xy_autoLayoutSetEdgeInsets:UIEdgeInsetsMake(80, 80, 80, 80) relatedBy:NSLayoutRelationLessThanOrEqual];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.backgroundColor = [UIColor lightGrayColor];
    [label2 xy_autoConstantToSuperWith:-50 withAttribute:NSLayoutAttributeLastBaseline withSuperView:self.view];
    [label2 xy_autoConstantToSuperWith:200 withAttribute:NSLayoutAttributeFirstBaseline];
    [label2 xy_autoMultiplierWith:0.8 withAttribute:(NSLayoutAttributeWidth)];
    
    
    UILabel *label3 = [[UILabel alloc]init];
    
    [label3 xy_autoLayoutSetSize:CGSizeMake(50, 50) withSuperView:self.view];
    
    xy_removeLayout(lay,label3, lay.firstAttribute == NSLayoutAttributeWidth || lay.firstAttribute == NSLayoutAttributeHeight);
    

    [label3 xy_autoFullSupViewWith:self.view relatedBy:NSLayoutRelationLessThanOrEqual];
    [label3 xy_autoMultiplierWith:0.5 withAttribute:(NSLayoutAttributeWidth)];
    [label3 xy_autoMultiplierWith:0.5 withAttribute:(NSLayoutAttributeHeight)];
    label3.backgroundColor = [UIColor darkGrayColor];
    
    [self.view bringSubviewToFront:label];
    [self.view bringSubviewToFront:label2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
