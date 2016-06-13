//
//  JXGuideFigure.h
//  JXLeadImagesTool
//
//  Created by 张明辉 on 16/6/7.
//  Copyright © 2016年 jesse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class JXGuideFigureShowVC;
@interface JXGuideFigure : NSObject

+ (instancetype)sharedFigure;

+ (void)figureWithImages:(NSArray *)images finashMainViewController:(UIViewController *)finashMainViewController;


/**
 *  pagecontrol的属性
 */
@property (nonatomic) float originY;
@property (nonatomic,strong) UIColor *currentPageColor;
@property (nonatomic,strong) UIColor *otherPageColor;



@end
