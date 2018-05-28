//
//  ViewController.m
//  SGPaging_D
//
//  Created by idea on 2018/5/28.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "ViewController.h"
#import "SGPagingView.h"
#import "AViewController.h"

#define KSCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define KSCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<SGPageTitleViewDelegate,SGPageContentViewDelegate>
@property (nonatomic, strong) SGPageContentView *pageContentView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupPageView];
}

- (void)setupPageView {
    NSArray *titleArr = @[@"备货中", @"已出货", @"已完成"];
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.indicatorStyle = SGIndicatorStyleDynamic;
    configure.spacingBetweenButtons = 35;
    configure.titleSelectedColor = UIColor.orangeColor;
    configure.indicatorColor = UIColor.cyanColor;
    configure.indicatorHeight = 5;
    configure.indicatorDynamicWidth = 40;
    /// pageTitleView
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, 44) delegate:self titleNames:titleArr configure:configure];
    [self.view addSubview:_pageTitleView];
    NSMutableArray *childArr = [NSMutableArray array];
    for (int i=0; i<titleArr.count; i++) {
        AViewController *vc= [[AViewController alloc] init];
        vc.str = [NSString stringWithFormat:@"%d",i];
        vc.block = ^(NSString *str) {
            if ([str isEqualToString:@"0"]) {
                [self.pageContentView setPageContentViewCurrentIndex:1];
            }else if([str isEqualToString:@"1"]){
               [self.pageContentView setPageContentViewCurrentIndex:2];
            }else{
                [self.pageContentView setPageContentViewCurrentIndex:0];
            }
            NSLog(@"str = %@",str);
        };
        [childArr addObject:vc];
    }
    /// pageContentView
    CGFloat contentViewHeight = self.view.frame.size.height - CGRectGetMaxY(_pageTitleView.frame);
    self.pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_pageTitleView.frame), KSCREEN_WIDTH, contentViewHeight) parentVC:self childVCs:childArr];
    _pageContentView.delegatePageContentView = self;
    [self.view addSubview:_pageContentView];
}



- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentView setPageContentViewCurrentIndex:selectedIndex];
}

- (void)pageContentView:(SGPageContentView *)pageContentView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
