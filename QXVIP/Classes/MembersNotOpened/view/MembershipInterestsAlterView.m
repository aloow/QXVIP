//
//  MembershipInterestsAlterView.m
//  QXMember
//
//  Created by iMac on 2020/9/3.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "MembershipInterestsAlterView.h"
#import "LEEAlert.h"

@interface MembershipInterestsAlterView()

//@property (weak, nonatomic) IBOutlet UILabel *scribingView;
@property (assign, nonatomic) BOOL isSelect;

@end


@implementation MembershipInterestsAlterView

- (void)setupView {
    self.isSelect = false;
}

// User Touch
- (IBAction)closeTap:(id)sender {
    
    [LEEAlert closeWithCompletionBlock:^{
        // 如果在关闭后需要做一些其他操作 建议在该Block中进行
    }];
    
}

- (IBAction)selectTap:(UIButton*)sender {
    
    self.isSelect = !self.isSelect;
    NSString *imageString = self.isSelect ?
    @"vip_pop_up_select" : @"vip_pop_up_unselect";
    [sender setImage:[UIImage imageNamed:imageString]
            forState:UIControlStateNormal];
    
}

// 确认支付
- (IBAction)confirmPayment:(id)sender {
    
    if (!self.isSelect) {
        NSLog(@"请选择已阅读并同意");
        return;
    }
    if (self.confirmAction != nil) {
        self.confirmAction();
    }
    [self closeTap:nil];
}


@end
