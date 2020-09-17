//
//  VIPService.h
//  QXMember
//
//  Created by iMac on 2020/9/15.
//  Copyright © 2020 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkTools.h"

NS_ASSUME_NONNULL_BEGIN

#define WeakObj(o) try{}@finally{} __weak typeof(o) o##Weak = o;
#define StrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;


@interface VIPService : NSObject

// 域名
@property (nonatomic, copy) NSString *domainUrl;

+ (instancetype)share;

// 登录手机请求验证码
- (void)requestMobileSMS:(NSString *)phoneNumber
                 success:(QXResponseSuccess)success
                    fail:(QXResponseFail)fail;


// 短信验证码和手机登录
- (void)requestUsername:(NSString *)mobile
             smsCaptcha:(NSString *)smsCaptcha
                  success:(QXResponseSuccess)success
                   fail:(QXResponseFail)fail;

// 用cookie 获取用户信息
- (void)requestUserInfoWithSuccess:(QXResponseSuccess)success
                            fail:(QXResponseFail)fail;

@end

NS_ASSUME_NONNULL_END
