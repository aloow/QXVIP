//
//  MemberCenterHeaderView.h
//  QXMember
//
//  Created by iMac on 2020/9/7.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "BaseXibView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickAction)(void);

@interface MemberCenterHeaderView : BaseXibView 

@property (nonatomic, copy) void(^clickAction)(void); /// 店铺收入
@property (nonatomic, copy) void(^clickAllShopAction)(void); /// 店铺商品
@property (nonatomic, copy) void(^clickTeach)(void); /// 师徒

@property (weak, nonatomic) IBOutlet UIView *bannerContainView;


@end

NS_ASSUME_NONNULL_END
