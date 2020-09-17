//
//  QXViewController.m
//  QXVIP
//
//  Created by aloow on 09/16/2020.
//  Copyright (c) 2020 aloow. All rights reserved.
//

#import "QXViewController.h"
#import <MGJRouter/MGJRouter.h>

@interface QXViewController ()

@end

@implementation QXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



// MARK:跳转到会员中心 方式1
- (IBAction)toMemberVC1:(id)sender {
    // 利用block进行 参数的回调
    void (^myBlock)(NSString*) = ^(NSString *text)
    {
       NSLog(@"%@",text);
    };
    // 目标界面需要的参数
    NSString *title = @"会员首页";
    // 封装成字典
    NSDictionary *dic = @{
        @"navigationVC":self.navigationController,
        @"title":title,
        @"block":myBlock
    };
    // 根据Url和字典，跳转到目标界面
    [MGJRouter openURL:@"QXVIP://MembersNot/home"
          withUserInfo:dic completion:^(id result) {
        NSLog(@"completion"); // 跳转后的回调
    }];
    
}

// MARK:跳转到会员中心方式 方式2
- (IBAction)toMemberVC2:(id)sender {
    // 根据url获取controller对象，然后跳转
    UIViewController *targetController = [MGJRouter objectForURL:@"QXVIP://MembersNot/getHome"];
    [self.navigationController pushViewController:targetController animated:true];
}


// 个人中心
- (IBAction)toMeVC:(id)sender {
    
    
    
}

@end
