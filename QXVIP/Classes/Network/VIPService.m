//
//  VIPService.m
//  QXMember
//
//  Created by iMac on 2020/9/15.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "VIPService.h"
#import "NetworkTools.h"
#import "QXHostNameManager.h"

@implementation VIPService

+ (instancetype)share {
    return [[self alloc] init];
}

- (void)requestMobileSMS:(NSString *)phoneNumber
                 success:(QXResponseSuccess)success
                    fail:(QXResponseFail)fail {
    
    self.domainUrl = [QXHostNameManager share].currentHost.userHost;
    
    NSString *path = @"/newUserCenter/smsCaptcha";
    NSDictionary *paramters = @{
        @"service": @"nk",
        @"type": @"login",
        @"mobile": phoneNumber
    };
    
    NSString *urlString = [self.domainUrl  stringByAppendingString:path];
    
    [NetworkTools.share getWithUrl:urlString
                            method:QXHTTPMethodGet
                            params:paramters
                           success:^(id  _Nonnull response) {
        success(response);
    } fail:^(NSError * _Nonnull error) {
        fail(error);
    }];
    
}

- (void)requestUsername:(NSString *)mobile
smsCaptcha:(NSString *)smsCaptcha
     success:(QXResponseSuccess)success
                   fail:(QXResponseFail)fail {
    
    NSString *path = @"/newUserCenter/doLoginApp";
    NSDictionary *paramters = @{
        @"smsCaptcha":smsCaptcha,
        @"mobile":mobile,
        @"clientType": @"ios"
    };
    
    NSString *urlString = [self.domainUrl  stringByAppendingString:path];
    
    [NetworkTools.share getWithUrl:urlString
                            method:QXHTTPMethodGet
                            params:paramters
                           success:^(id  _Nonnull response) {
        success(response);
    } fail:^(NSError * _Nonnull error) {
        fail(error);
    }];
    
}



- (void)requestUserInfoWithSuccess:(QXResponseSuccess)success
                            fail:(QXResponseFail)fail {
    
    NSString *path = @"/nk/member/uc/info";
    NSString *urlString = [self.domainUrl  stringByAppendingString:path];
    
    NSDictionary *headers = @{};
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    NSDictionary *Request = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
    NSString *cookie = [Request objectForKey:@"Cookie"];
    if (cookie) {
        headers = @{@"Cookie": cookie};
    } else {
        headers = nil;
    }
    
    [NetworkTools.share getWithUrl:urlString method:QXHTTPMethodGet params:nil headers:headers success:^(id  _Nonnull response) {
        success(response);
    } fail:^(NSError * _Nonnull error) {
        fail(error);
    }];
    
}

// MARK: Tool
//- (void)networkScuucess:(id)response
//         completeHander:(NetWorkCompletehander)block {
//    
//}
//
//- (void)networkError:(NSError *)error
//      completeHander:(NetWorkCompletehander)block {
//
//}


// MARK: GET & SET


@end
