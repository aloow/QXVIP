//
//  TeachRewardController.m
//  QXMember
//
//  Created by iMac on 2020/9/14.
//  Copyright © 2020 iMac. All rights reserved.
//  师徒

#import "TeachRewardController.h"
#import <JXCategoryView/JXCategoryView.h>
#import <YYCategories/YYCategories.h>
#import "IncomeDetailListController.h"
#import <Masonry/Masonry.h>
#import "QXHostNameManager.h"
#import "JXBWebViewController.h"

@interface TeachRewardController ()<JXCategoryViewDelegate, JXCategoryListContainerViewDelegate>

@property (nonatomic, strong) NSArray *titles;
@property (weak, nonatomic) IBOutlet JXCategoryTitleView *categoryView;

@end

@implementation TeachRewardController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"师徒";
    
    [self setupCategory];
    [self setupCategoryListContainerView];
    
}

// MARK:Set up view
- (void)setupCategory {
    //
    self.titles = @[@"待收徒弟", @"我的徒弟"];
    
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
    self.categoryView.indicators = @[lineView];
    
    
}

- (void)setupCategoryListContainerView {
    JXCategoryListContainerView *listContainerView = [[JXCategoryListContainerView alloc]
                                                  initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    [self.view addSubview:listContainerView];
    [listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.categoryView.mas_bottom);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
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

// MARK: User Touch
- (IBAction)ruleDetailTap:(id)sender {
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@",
   [QXHostNameManager share].currentHost.mallHost, @"/pagesHelp/help/pupilRule"];
    
    NSLog(@"%@", urlString);
    JXBWebViewController *webView = [[JXBWebViewController alloc] initWithURLString:urlString];
    [self.navigationController pushViewController:webView animated:true];
    
}



@end
