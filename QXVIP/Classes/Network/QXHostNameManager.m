//
//  QXHostNameManager.m
//  QXTestLogin_Example
//
//  Created by iMac on 2020/8/27.
//  Copyright © 2020 aloow. All rights reserved.
//

#import "QXHostNameManager.h"

// MARK: QXHostname
@implementation QXHostInfo
@end


// MARK: QXHostNameManager
@interface QXHostNameManager()

@property(nonatomic, strong) QXHostInfo *devHost;
@property(nonatomic, strong) QXHostInfo *nkHost;
@property(nonatomic, strong) QXHostInfo *proHost;
@property(nonatomic,strong)  QXHostInfo *nkmdVPN;//需要VPN
@property(nonatomic, strong) QXHostInfo *nkTestHost;

@end

@implementation QXHostNameManager

+ (instancetype)share
{
    static QXHostNameManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[QXHostNameManager alloc] init];
     
    #ifdef DEBUG
        [instance setHost:NK];
    #else
        [instance setHost:Pro];
    #endif
        
    });
    return instance;
}

- (void)setHost:(QXHostType)type
{
    switch (type) {
        case Pro:
            self.currentHost = self.proHost;
            break;
        case Dev:
            self.currentHost = self.devHost;
            break;
        case NK:
            self.currentHost = self.nkHost;
            break;
        case NKMDVPN:
            self.currentHost = self.nkmdVPN;
            break;
        case NKTest:
            self.currentHost = self.nkTestHost;
            break;
    }
}

- (QXHostInfo *)nkmdVPN{
    if (!_nkmdVPN) {
        _nkmdVPN = [[QXHostInfo alloc]init];
        _nkmdVPN.name = @"nkmdVPN";
        _nkmdVPN.userHost = @"http://user.nk.md";
        _nkmdVPN.mallHost = @"http://mall.nk.md";
        _nkmdVPN.imageHost = @"http://static.nkdev.md";
    }
    return  _nkmdVPN;

}

- (QXHostInfo *)devHost{
    if (!_devHost) {
        _devHost = [[QXHostInfo alloc] init];
        _devHost.name = @"dev";
        _devHost.userHost = @"https://user-dev.liux.co";
        _devHost.mallHost = @"https://mall-dev.liux.co";
        _devHost.imageHost = @"https://static-dev.liux.co";
        //@"https://static-dev.liux.co"
        _devHost.bankLinkHost = @"https://my-st1.orangebank.com.cn/corporbank/perRegedit_H5.do";
        _devHost.ubindLinkHost = @"https://my-st1.orangebank.com.cn/corporbank/index_payb_H5.jsp";
    }
    return _devHost;
}

- (QXHostInfo *)nkTestHost
{
    if (!_nkTestHost) {
        _nkTestHost = [[QXHostInfo alloc] init];
        _nkTestHost.name = @"nkTest";
        _nkTestHost.userHost = @"https://user-nktest.liux.co";
        _nkTestHost.mallHost = @"https://mall-nktest.liux.co";
        _nkTestHost.imageHost = @"https://static-nktest.liux.co";
        _nkTestHost.bankLinkHost = @"https://my-st1.orangebank.com.cn/corporbank/perRegedit_H5.do";
        _nkTestHost.ubindLinkHost = @"https://my-st1.orangebank.com.cn/corporbank/index_payb_H5.jsp";
    }
    return _nkTestHost;
}

- (QXHostInfo *)nkHost{
    if (!_nkHost) {
        _nkHost = [[QXHostInfo alloc] init];
        _nkHost.name = @"nk";
        _nkHost.userHost = @"https://user-nk.liux.co";
        _nkHost.mallHost = @"https://mall-nk.liux.co";
        _nkHost.imageHost = @"https://static-nk.liux.co";
        _nkHost.bankLinkHost = @"https://my-st1.orangebank.com.cn/corporbank/perRegedit_H5.do";
        _nkHost.ubindLinkHost = @"https://my-st1.orangebank.com.cn/corporbank/index_payb_H5.jsp";
    }
    return _nkHost;
}


- (QXHostInfo *)proHost{
    if (!_proHost) {
        _proHost = [[QXHostInfo alloc] init];
        _proHost.name = @"pro";
        _proHost.userHost = @"https://user.6ke.com";
        _proHost.mallHost = @"https://mall.6ke.com";
        _proHost.imageHost = @"https://files.6ke.com";
        _proHost.bankLinkHost = @"https://ebank.sdb.com.cn/corporbank/perRegedit_H5.do";
        _proHost.ubindLinkHost = @"https://ebank.sdb.com.cn/corporbank/index_payb_H5.jsp";
    }
    return _proHost;
}

@end
