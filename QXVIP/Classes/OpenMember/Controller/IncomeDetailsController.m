//
//  IncomeDetailsController.m
//  QXMember
//
//  Created by iMac on 2020/9/10.
//  Copyright © 2020 iMac. All rights reserved.
//  商店收益

#import "IncomeDetailsController.h"
#import <JXCategoryView/JXCategoryView.h>
#import "TypeSelectView.h"
#import <YYCategories/YYCategories.h>
#import "IncomeDetailListController.h"

@interface IncomeDetailsController ()<JXCategoryViewDelegate, JXCategoryListContainerViewDelegate>

@property (nonatomic, strong) NSArray *titles;

@property (weak, nonatomic) IBOutlet JXCategoryTitleView *categoryView;
@property (weak, nonatomic) IBOutlet TypeSelectView *typeSelectView;
@property (weak, nonatomic) IBOutlet UIView *containView;



@end

@implementation IncomeDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupCategory];
    [self setupCategoryListContainerView];
    
}


// MARK:Set up view
- (void)setupCategory {
    //
    self.titles = @[@"全部", @"待付款", @"已付款",@"已结算",@"已失效",];
    
    self.categoryView.delegate = self;
    
    self.categoryView.titles = self.titles;
    self.categoryView.backgroundColor = UIColor.whiteColor;
    self.categoryView.titleColorGradientEnabled = YES;
    self.categoryView.titleFont = [UIFont systemFontOfSize:16];
    self.categoryView.titleSelectedColor = UIColor.blackColor;
    self.categoryView.titleSelectedFont = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    
    // 添加指示器
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorWidth = 20;
    lineView.lineStyle = JXCategoryIndicatorLineStyle_Lengthen;
    lineView.indicatorColor = [UIColor colorWithHexString:@"#FF9913"];
    lineView.indicatorWidth = JXCategoryViewAutomaticDimension;
    self.categoryView.indicators = @[lineView];
    
    
}

- (void)setupCategoryListContainerView {
    JXCategoryListContainerView *listContainerView = [[JXCategoryListContainerView alloc]
                                                  initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    listContainerView.frame = self.containView.bounds;
    [self.containView addSubview:listContainerView];
    //关联到categoryView
    self.categoryView.listContainer = listContainerView;
    
}


#pragma mark - JXCategoryViewDelegate
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    //侧滑手势处理
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

#pragma mark - JXCategoryListContainerViewDelegate

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    IncomeDetailListController *list = [[IncomeDetailListController alloc] init];
    return list;
}

- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titles.count;
}

@end
