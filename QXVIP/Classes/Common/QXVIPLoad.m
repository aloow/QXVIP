//
//  QXVIPLoad.m
//  AFNetworking
//
//  Created by iMac on 2020/9/16.
//

#import "QXVIPLoad.h"
#import <MGJRouter/MGJRouter.h>
#import "QXVIPPublicHeader.h"
#import "VIPContrainerController.h"

@implementation QXVIPLoad

+ (void)load {
    
    [MGJRouter registerURLPattern:QXVIPHomeController
                        toHandler:^(NSDictionary *routerParameters) {
        UINavigationController *navigationVC = routerParameters[MGJRouterParameterUserInfo][@"navigationVC"];
        // block
        void(^block)(NSString *) = routerParameters[MGJRouterParameterUserInfo][@"block"];
        
        NSString *title = routerParameters[MGJRouterParameterUserInfo][@"title"];
       
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        
        VIPContrainerController *vipContrainerController = [[VIPContrainerController alloc]
                                                            initWithNibName:@"VIPContrainerController"
                                                            bundle:bundle];
        vipContrainerController.title = title;
        
        [navigationVC pushViewController:vipContrainerController animated:YES];
        
    }];
    
    
    [MGJRouter registerURLPattern:GetQXVIPHomeController toObjectHandler:^id(NSDictionary *routerParameters) {
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        VIPContrainerController *vipContrainerController = [[VIPContrainerController alloc]
                                                            initWithNibName:@"VIPContrainerController"
                                                            bundle:bundle];
        return vipContrainerController;
    }];
    
    
}

@end
