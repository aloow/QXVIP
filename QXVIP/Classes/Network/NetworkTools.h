//
//  NetworkTools.h
//  NetWorkDemo
//
//  Created by iMac on 2020/9/15.
//  Copyright © 2020 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSURLSessionTask QXURLSessionTask;
typedef void(^QXResponseSuccess)(id response);
typedef void(^QXResponseFail)(NSError *error);
typedef void (^QXDownloadProgress)(int64_t bytesRead,
                                    int64_t totalBytesRead);

typedef NS_ENUM(NSUInteger, QXHTTPMethod) {
  QXHTTPMethodGet = 1, // 默认
  QXHTTPMethodPost  = 2,
};

@interface NetworkTools : NSObject
//类方法
+ (NetworkTools *)share;

/*!
*
*  GET请求接口，若不指定baseurl，可传完整的url
*
*  @param url     请求完整的路径，如/path/getArticleList
*  @param method     请求方法，如Get Post
*  @param params  接口中所需要的拼接参数，如@{"categoryid" : @(12)}
*  @param headers     请求头部
*  @param success 接口成功请求到数据的回调
*  @param fail    接口请求数据失败的回调
*
*  @return 返回的对象中有可取消请求的API
*/
- (QXURLSessionTask *)getWithUrl:(NSString *)url
                          method:(QXHTTPMethod)method  /// 默认Get
                          params:(NSDictionary *)params/// 默认nil
                         headers:(NSDictionary<NSString *,NSString *> *)headers
                        progress:(QXDownloadProgress)progress
                         success:(QXResponseSuccess)success
                            fail:(QXResponseFail)fail;

/// method 默认get，params默认nil
- (QXURLSessionTask *)getWithUrl:(NSString *)url
                          success:(QXResponseSuccess)success
                             fail:(QXResponseFail)fail;

/// params默认nil
- (QXURLSessionTask *)getWithUrl:(NSString *)url
                          method:(QXHTTPMethod)method
                         success:(QXResponseSuccess)success
                            fail:(QXResponseFail)fail;
// 添加params
- (QXURLSessionTask *)getWithUrl:(NSString *)url
                          method:(QXHTTPMethod)method
                          params:(NSDictionary *)params
                         success:(QXResponseSuccess)success
                            fail:(QXResponseFail)fail;
// 添加headers
- (QXURLSessionTask *)getWithUrl:(NSString *)url
                          method:(QXHTTPMethod)method  /// 默认Get
                          params:(NSDictionary *)params/// 默认nil
                         headers:(NSDictionary<NSString *,NSString *> *)headers
                         success:(QXResponseSuccess)success
                            fail:(QXResponseFail)fail;


@end

NS_ASSUME_NONNULL_END
