//
//  VIPMembersController.m
//  QXMember
//
//  Created by iMac on 2020/9/2.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "VIPMembersController.h"
#import "VIPContrainerController.h"
#import "JXBWebViewController.h"
#import "MembershipInterestsAlterView.h"
#import "LEEAlert.h"
#import "InvitationPosterController.h"

@interface VIPMembersController ()

@end

@implementation VIPMembersController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)swichToSvip:(id)sender {

    VIPContrainerController *vipContrainer = self.parentViewController;
    [vipContrainer switchToSVip];
    
}

- (IBAction)midTap:(UITapGestureRecognizer *)sender {
    
    NSString *urlString = @"https://mall-nk.liux.co/pagesHelp/member/memberNews?indexNum=";
    [urlString stringByAppendingFormat:@"%ld",(long)sender.view.tag];
    NSLog(@"%@", urlString);
    JXBWebViewController *webView = [[JXBWebViewController alloc] initWithURLString:urlString];
    [self.parentViewController.navigationController pushViewController:webView animated:true];
    
}

//免费升级
- (IBAction)freeUpgrade:(id)sender {
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    InvitationPosterController *invitationPosterController = [[InvitationPosterController alloc]
    initWithNibName:@"InvitationPosterController" bundle:bundle];
    
    [self.parentViewController.navigationController
     pushViewController:invitationPosterController animated:true];
    
}


@end
