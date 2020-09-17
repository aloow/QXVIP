//
//  SVIPMembersController.m
//  QXMember
//
//  Created by iMac on 2020/9/2.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "SVIPMembersController.h"
#import "VIPContrainerController.h"
#import "JXBWebViewController.h"
#import "MemberCenterController.h"
#import "MembershipInterestsAlterView.h"
#import "LEEAlert.h"
#import <YYCategories/YYCategories.h>

@interface SVIPMembersController ()

@end

@implementation SVIPMembersController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)swichToVip:(id)sender {

    VIPContrainerController *vipContrainer = self.parentViewController;
    [vipContrainer switchToVip];
    
}

- (IBAction)midTap:(UITapGestureRecognizer *)sender {
    // 0开始
    NSString *urlString = @"https://mall-nk.liux.co/pagesHelp/member/memberNews?indexNum=";
    [urlString stringByAppendingFormat:@"%ld",(long)sender.view.tag];
    JXBWebViewController *webView = [[JXBWebViewController alloc] initWithURLString:urlString];
    [self.parentViewController.navigationController pushViewController:webView animated:true];
    
}

- (IBAction)upgradeTap:(id)sender {
    
    // 弹窗
    MembershipInterestsAlterView *openView = [[MembershipInterestsAlterView alloc] init];
    openView.width = [UIScreen mainScreen].bounds.size.width;
    
    __weak __typeof(self) weakSelf = self;
    openView.confirmAction = ^(void){
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf jumpToMemberHadOpen];
    };
    
    [LEEAlert actionsheet].config
    .LeeCustomView(openView)
    .LeeHeaderInsets(UIEdgeInsetsMake(0, 0, 0, 0))
    .LeeActionSheetBackgroundColor([UIColor whiteColor])
    .LeeCornerRadius(10.0f)
    .LeeActionSheetHeaderCornerRadii(CornerRadiiMake(0, 0, 0, 0))
    .LeeMaxWidth([UIScreen mainScreen].bounds.size.width)
    .LeeShow();
    
    
}

// 已开通会员
- (void)jumpToMemberHadOpen {
    
    MemberCenterController * vc = [[MemberCenterController alloc] init];
    [self.navigationController pushViewController:vc animated:true];
    
}


@end
