//
//  JXGuideFigureShowVC.m
//  JXLeadImagesTool
//
//  Created by 张明辉 on 16/6/7.
//  Copyright © 2016年 jesse. All rights reserved.
//

#import "JXGuideFigureShowVC.h"
#import "JXGuideFigureTool.h"

@interface JXGuideFigureShowVC ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIPageControl *pageControl;
@end

@implementation JXGuideFigureShowVC

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置界面
    [self setupView];
}
- (void)setupView {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    scrollView.contentSize = CGSizeMake(self.images.count * SCREEN_WIDTH, SCREEN_HEIGHT);
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    [self.view addSubview:scrollView];
    
    for (int i = 0; i < self.images.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [btn setBackgroundImage:[UIImage imageNamed:self.images[i]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:self.images[i]] forState:UIControlStateHighlighted];
        if (i == self.images.count - 1) {
            [btn addTarget:self action:@selector(clickLastBtn) forControlEvents:UIControlEventTouchUpInside];
        }
        [scrollView addSubview:btn];
    }
    
    /**
     UIPageControl
     */
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.originY, SCREEN_WIDTH, 20)];
    self.pageControl.enabled = NO;
    self.pageControl.numberOfPages = self.images.count;
    self.pageControl.currentPageIndicatorTintColor = self.currentPageColor;
    self.pageControl.pageIndicatorTintColor = self.otherPageColor;
    [self.view addSubview:self.pageControl];
}
- (void)clickLastBtn
{
    if (self.clickLastPage) {
        self.clickLastPage();
    }
}


#pragma mark - scrollview delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / SCREEN_WIDTH;
    
    self.pageControl.currentPage = page;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
