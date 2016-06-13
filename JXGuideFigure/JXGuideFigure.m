//
//  JXGuideFigure.m
//  JXLeadImagesTool
//
//  Created by 张明辉 on 16/6/7.
//  Copyright © 2016年 jesse. All rights reserved.
//

#import "JXGuideFigure.h"
#import "JXGuideFigureShowVC.h"
#import "JXGuideFigureTool.h"


@interface JXGuideFigure ()
@property (nonatomic,strong) JXGuideFigureShowVC *showVC;
@end

@implementation JXGuideFigure

+ (instancetype)sharedFigure
{
    static JXGuideFigure *figure;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        figure = [[JXGuideFigure alloc] init];
        //创建对应的控制器
        figure.showVC = [[JXGuideFigureShowVC alloc] init];
        figure.showVC.originY = SCREEN_HEIGHT - 50;
    });
    return figure;
}

+ (void)figureWithImages:(NSArray *)images finashMainViewController:(UIViewController *)finashMainViewController
{
    JXGuideFigure *figure = [JXGuideFigure sharedFigure];
    //当前运行的版本
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    
    //本地保存的版本号
    NSUserDefaults *userDe = [NSUserDefaults standardUserDefaults];
    NSString *localVersion = [userDe objectForKey:kAPP_Version];
    
    
    if ([currentVersion isEqualToString:localVersion]) {
        //已经运行过该版本
        
        [[[[UIApplication sharedApplication] delegate] window] setRootViewController:finashMainViewController];
        return;
    } else {
        
        figure.showVC.images = images;
        figure.showVC.clickLastPage = ^(){
            //更新本地存储的版本
            [userDe setObject:currentVersion forKey:kAPP_Version];
            [userDe synchronize];
            
            [[[[UIApplication sharedApplication] delegate] window] setRootViewController:finashMainViewController];
        };
        [[[[UIApplication sharedApplication] delegate] window] setRootViewController:figure.showVC];
    }
}

#pragma mark - 修改默认pageControl属性
-(void)setOtherPageColor:(UIColor *)otherPageColor
{
    [JXGuideFigure sharedFigure].showVC.otherPageColor = otherPageColor;
}
-(void)setCurrentPageColor:(UIColor *)currentPageColor
{
    [JXGuideFigure sharedFigure].showVC.currentPageColor = currentPageColor;
}
-(void)setOriginY:(float)originY
{
    [JXGuideFigure sharedFigure].showVC.originY = originY;
}

@end
