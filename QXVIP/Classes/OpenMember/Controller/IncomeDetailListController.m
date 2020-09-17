//
//  IncomeDetailListController.m
//  QXMember
//
//  Created by iMac on 2020/9/9.
//  Copyright © 2020 iMac. All rights reserved.
//  收入明细 列表

#import "IncomeDetailListController.h"

#define COLOR_WITH_RGB(R,G,B,A) [UIColor colorWithRed:R green:G blue:B alpha:A]

@interface IncomeDetailListController ()

@end

@implementation IncomeDetailListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = COLOR_WITH_RGB(arc4random()%255/255.0, arc4random()%255/255.0, arc4random()%255/255.0, 1);
    
}

#pragma mark - JXCategoryListContentViewDelegate

- (UIView *)listView {
    return self.view;
}
@end
