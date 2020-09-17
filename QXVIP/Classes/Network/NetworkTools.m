//
//  NetworkTools.m
//  NetWorkDemo
//
//  Created by iMac on 2020/9/15.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "NetworkTools.h"
#import <AFNetworking/AFNetworking.h>
static NetworkTools* instance = nil;

@implementation NetworkTools

+ (NetworkTools *)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone*)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });    return instance;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return instance;
}



/// method 默认get，params默认nil
- (QXURLSessionTask *)getWithUrl:(NSString *)url
                          success:(QXResponseSuccess)success
                            fail:(QXResponseFail)fail {
    return [self getWithUrl:url
                     method:nil
                    success:success
                       fail:fail];
}

/// params默认nil
- (QXURLSessionTask *)getWithUrl:(NSString *)url
                          method:(QXHTTPMethod)method
                         success:(QXResponseSuccess)success
                            fail:(QXResponseFail)fail {
    return [self getWithUrl:url
                     method:method
                     params:nil
                    success:success
                       fail:fail];
}
// 添加params
- (QXURLSessionTask *)getWithUrl:(NSString *)url
                          method:(QXHTTPMethod)method
                          params:(NSDictionary *)params
                         success:(QXResponseSuccess)success
                            fail:(QXResponseFail)fail {
    return [self getWithUrl:url
                     method:method
                     params:params
                    headers:nil
                    success:success
                       fail:fail];
}
// 添加headers
- (QXURLSessionTask *)getWithUrl:(NSString *)url
                          method:(QXHTTPMethod)method  /// 默认Get
                          params:(NSDictionary *)params/// 默认nil
                         headers:(NSDictionary<NSString *,NSString *> *)headers
                         success:(QXResponseSuccess)success
                            fail:(QXResponseFail)fail {
    return [self getWithUrl:url
                     method:method
                     params:params
                    headers:headers
                   progress:nil
                    success:success
                       fail:fail];
}

// 添加进度
- (QXURLSessionTask *)getWithUrl:(NSString *)url
                          method:(QXHTTPMethod)method  /// 默认Get
                          params:(NSDictionary *)params/// 默认nil
                         headers:(NSDictionary<NSString *,NSString *> *)headers
                        progress:(QXDownloadProgress)progress
                         success:(QXResponseSuccess)success
                            fail:(QXResponseFail)fail {
    // TODO: 请求前： 1.网络监测 2.url过滤 3.无网络使用缓存数据等
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    QXURLSessionTask *session = nil;
                 
    // TODO: 请求中：加载器
    if (method == QXHTTPMethodGet) {
        
        session = [manager GET:url
                    parameters:params
                       headers:headers
                      progress:^(NSProgress * _Nonnull downloadProgress)
        {   // 进度
            if (progress) {
                progress(downloadProgress.completedUnitCount, downloadProgress.totalUnitCount);
            }
            NSLog(@"%lld",downloadProgress.completedUnitCount);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            // 成功回调
            NSLog(@"success");
            [self successResponse:responseObject callback:success];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 失败回调
            NSLog(@"failure");
            [self handleCallbackWithError:error fail:fail];
        }];
        
    } else if (method == QXHTTPMethodPost) {
        
        session = [manager POST:url
                    parameters:params
                       headers:headers
                      progress:^(NSProgress * _Nonnull downloadProgress)
        {   // 进度
            if (progress) {
                progress(downloadProgress.completedUnitCount, downloadProgress.totalUnitCount);
            }
            NSLog(@"%lld",downloadProgress.completedUnitCount);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            // 成功回调
            NSLog(@"success");
            [self successResponse:responseObject callback:success];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 失败回调
            NSLog(@"failure");
            [self handleCallbackWithError:error fail:fail];
        }];
        
        // TODO: 请求后: 成功、失败回调需要统一做的事。例如结束加载
    }
    
    // TODO: 支持链式调用，可以主动取消网络请求task
    return session;
    
}

// MARK: Tool
- (void)successResponse:(id)responseObject callback:(QXResponseSuccess)success {
    if (success) {
      success([self tryToParseData:responseObject]);
    }
}

- (id)tryToParseData:(id)responseData {
  if ([responseData isKindOfClass:[NSData class]]) {
    // 尝试解析成JSON
    if (responseData == nil) {
      return responseData;
    } else {
      NSError *error = nil;
        NSDictionary *response =
        [NSJSONSerialization JSONObjectWithData:responseData
                                        options:NSJSONReadingMutableContainers
                                          error:&error];
      if (error != nil) {
        return responseData;
      } else {
        return response;
      }
    }
  } else {
    return responseData;
  }
}

- (void)handleCallbackWithError:(NSError *)error fail:(QXResponseFail)fail {
    fail(error);
}
@end
