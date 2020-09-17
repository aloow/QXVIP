//
//  QXHostNameManager.h
//  QXTestLogin_Example
//
//  Created by iMac on 2020/8/27.
//  Copyright © 2020 aloow. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

// MARK: QXHostname
@interface QXHostInfo : NSObject
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *imageHost;
@property(nonatomic, copy) NSString *userHost;
@property(nonatomic, copy) NSString *mallHost;
@property(nonatomic, copy) NSString *bankLinkHost;
@property(nonatomic, copy) NSString *ubindLinkHost;
@end



// MARK: QXHostNameManager
typedef NS_ENUM(NSInteger, QXHostType) {
    Dev,
    NK,
    NKTest,
    Pro,
    NKMDVPN,
};

@interface QXHostNameManager : NSObject

@property(nonatomic, strong) QXHostInfo *currentHost;

+ (instancetype)share;

- (void)setHost:(QXHostType)type;

@end

NS_ASSUME_NONNULL_END
