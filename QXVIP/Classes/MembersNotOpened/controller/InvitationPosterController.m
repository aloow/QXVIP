//
//  InvitationPosterController.m
//  QXMember
//
//  Created by iMac on 2020/9/14.
//  Copyright © 2020 iMac. All rights reserved.
//  邀请海报

#import "InvitationPosterController.h"
#import "NewPagedFlowView.h"
#import "PosterPagerView.h"
#import <Masonry/Masonry.h>

@interface InvitationPosterController ()<NewPagedFlowViewDelegate, NewPagedFlowViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *pageContainerView;
@property (nonatomic, strong) NewPagedFlowView *pageFlowView;

@end

@implementation InvitationPosterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"邀请海报";
    
    [self.pageFlowView reloadData];
    
}

#pragma mark setter and getter
- (NewPagedFlowView *)pageFlowView{
    if (!_pageFlowView) {
       
        _pageFlowView = [[NewPagedFlowView alloc] init];
        _pageFlowView.frame = self.pageContainerView.bounds;
        
        _pageFlowView.delegate = self;
        _pageFlowView.dataSource = self;
        _pageFlowView.minimumPageAlpha = 0.1;
        _pageFlowView.isCarousel = YES;
        _pageFlowView.isOpenAutoScroll = NO;
        _pageFlowView.backgroundColor = [UIColor clearColor];
        _pageFlowView.orientation = NewPagedFlowViewOrientationHorizontal;
        _pageFlowView.leftRightMargin = 40;
        _pageFlowView.topBottomMargin = 40;
        [self.pageContainerView addSubview:_pageFlowView];
        
    }
    return _pageFlowView;
}

#pragma mark NewPagedFlowView Datasource
- (NSInteger)numberOfPagesInFlowView:(NewPagedFlowView *)flowView {
    return 3;
}

#pragma mark NewPagedFlowView Delegate
- (CGSize)sizeForPageInFlowView:(NewPagedFlowView *)flowView {
    if ([UIScreen mainScreen].bounds.size.width == 375) {
        return CGSizeMake(196, 360);
    }
    return CGSizeMake(230, 418);
}

- (PGIndexBannerSubiew *)flowView:(NewPagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
    
    PGIndexBannerSubiew *bannerView = [flowView dequeueReusableCell];
    if (!bannerView) {
        bannerView = [[PGIndexBannerSubiew alloc] init];
        bannerView.tag = index;
        bannerView.layer.cornerRadius = 8;
        bannerView.layer.masksToBounds = YES;
    }
    
    if ([bannerView viewWithTag:101] == nil) {
        PosterPagerView *posterPagerView = [[PosterPagerView alloc] init];
        posterPagerView.tag = 101;
        posterPagerView.frame = bannerView.bounds;
        [bannerView addSubview:posterPagerView];
        [posterPagerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsZero);
        }];
    }
    
    return bannerView;
}


@end
