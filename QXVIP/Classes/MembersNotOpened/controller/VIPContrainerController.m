//
//  VIPContrainerController.m
//  QXMember
//
//  Created by iMac on 2020/9/2.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "VIPContrainerController.h"
#import "VIPMembersController.h"
#import "SVIPMembersController.h"

@interface VIPContrainerController ()

@property (weak, nonatomic) IBOutlet UIStackView *containerStackView;


@end

@implementation VIPContrainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"会员";
    
    [self switchToVip];
    
}

// MARK: USer Touch
- (void)switchToVip {
    [self addVipControllerRemoveSvip];
}

- (void)switchToSVip {
    [self addSVipControllerRemoveVip];
}

// TODO: 开通记录
- (IBAction)OpenRecord:(id)sender {
    
    
    
}

// MARK: Tool
- (void)addVipControllerRemoveSvip {
    if (self.childViewControllers.firstObject) {
        UIViewController * vc = self.childViewControllers.firstObject;
        [self remove:vc with:vc.view];
    }
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    VIPMembersController *vipMembersController = [[VIPMembersController alloc]
    initWithNibName:@"VIPMembersController"
    bundle:bundle];
    
    [self add:vipMembersController with:vipMembersController.view];
}

- (void)addSVipControllerRemoveVip {
    if (self.childViewControllers.firstObject) {
        UIViewController * vc = self.childViewControllers.firstObject;
        [self remove:vc with:vc.view];
    }
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    SVIPMembersController *svipMembersController = [[SVIPMembersController alloc]
    initWithNibName:@"SVIPMembersController"
    bundle:bundle];
    
    [self add:svipMembersController with:svipMembersController.view];
}


// MARK: Add Remove
- (void)add:(UIViewController *)controler with:(UIView *)view {
    // Add the view controller to the container.
    [self addChildViewController:controler];
    [self.containerStackView addArrangedSubview:view];
    // Create and activate the constraints for the child’s view.
    
    // Notify the child view controller that the move is complete.
    [controler didMoveToParentViewController:self];
}

- (void)remove:(UIViewController *)controler with:(UIView *)view {
    [controler willMoveToParentViewController:self];
    // remove any constraints for the child’s root view
    
    [view removeFromSuperview];
    [controler removeFromParentViewController];
}

@end
