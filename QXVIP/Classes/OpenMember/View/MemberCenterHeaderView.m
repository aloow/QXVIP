//
//  MemberCenterHeaderView.m
//  QXMember
//
//  Created by iMac on 2020/9/7.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "MemberCenterHeaderView.h"
#import <YYCategories/YYCategories.h>
#import <SDCycleScrollView/SDCycleScrollView.h>

@interface MemberCenterHeaderView()<SDCycleScrollViewDelegate>

@end

@implementation MemberCenterHeaderView 

- (void)setupView {
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero
                                         imageNamesGroup:@[@"vip_center_mid_adv1",@"vip_center_mid_adv2"]];
    cycleScrollView.frame = self.bannerContainView.bounds;
    cycleScrollView.delegate = self;
    cycleScrollView.autoScrollTimeInterval = 15.0;
    cycleScrollView.backgroundColor = [UIColor clearColor];
    [self.bannerContainView addSubview:cycleScrollView];
    
}

// MARK: User Touch
// 店铺收益
- (IBAction)clickShop:(id)sender {
    
    if (self.clickAction != nil) {
        self.clickAction();
    }
    
}

// 店铺商品 查看全部
- (IBAction)clickAllShop:(id)sender {
    
    if (self.clickAllShopAction != nil) {
        self.clickAllShopAction();
    }
    
}

// 师徒
- (IBAction)teachTap:(id)sender {
    
    if (self.clickTeach != nil) {
        self.clickTeach();
    }
    
}


@end
