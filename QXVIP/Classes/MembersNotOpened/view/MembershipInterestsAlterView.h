//
//  MembershipInterestsAlterView.h
//  QXMember
//
//  Created by iMac on 2020/9/3.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "BaseXibView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ConfirmAction)(void);

@interface MembershipInterestsAlterView : BaseXibView

@property (nonatomic, copy) ConfirmAction confirmAction;

@end

NS_ASSUME_NONNULL_END

/*
 - (IBAction)selectTap:(UIButton*)sender {
     
     NSString *imageString = self.isSelect ?
     @"vip_pop_up_select" : @"vip_pop_up_unselect";
     [sender setImage:[UIImage imageNamed:imageString]
             forState:UIControlStateNormal];
     
 }
 
 - (void)setupView {
     self.isSelect = false;
 }
 */
