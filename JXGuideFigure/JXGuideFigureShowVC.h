//
//  JXGuideFigureShowVC.h
//  JXLeadImagesTool
//
//  Created by 张明辉 on 16/6/7.
//  Copyright © 2016年 jesse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXGuideFigureShowVC : UIViewController
//images
@property (nonatomic,strong) NSArray *images;
//click
@property (nonatomic,strong) void (^clickLastPage) ();


/**
 *  pagecontrol的属性
 */
@property (nonatomic) float originY;
@property (nonatomic,strong) UIColor *currentPageColor;
@property (nonatomic,strong) UIColor *otherPageColor;

@end
