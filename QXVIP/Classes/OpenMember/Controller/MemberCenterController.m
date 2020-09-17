//
//  MemberCenterController.m
//  QXMember
//
//  Created by iMac on 2020/9/4.
//  Copyright © 2020 iMac. All rights reserved.
//  会员中心(已开通会员)

#import "MemberCenterController.h"
#import "MemberCenterCell.h"
#import "MemberCenterHeaderView.h"
#import <Masonry/Masonry.h>
#import <YYCategories/YYCategories.h>
#import "IncomeDetailsController.h"
#import "TeachRewardController.h"

@interface MemberCenterController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation MemberCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupTableview];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)setupTableview {
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UINib *memberCenterCellNib = [UINib nibWithNibName:@"MemberCenterCell"
                                                bundle:bundle];
    [self.tableView registerNib:memberCenterCellNib
         forCellReuseIdentifier:@"MemberCenterCell"];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.view);
    }];
    
    MemberCenterHeaderView *headerView = [[MemberCenterHeaderView alloc] init];
    // help view
    UIView *view = [[UIView alloc]
    initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 683)];
    headerView.frame = view.bounds;
    [view addSubview:headerView];
    
    self.tableView.tableHeaderView = view;
    
    __weak __typeof(self) weakSelf = self;
    // 点击了店铺收入
    headerView.clickAction = ^{
        // 店铺明细
        __strong typeof(self) strongSelf = weakSelf;
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        IncomeDetailsController *incomeDetailsController = [[IncomeDetailsController alloc]
                                                            initWithNibName:@"IncomeDetailsController"
                                                            bundle:bundle];
        [strongSelf.navigationController pushViewController:incomeDetailsController animated:true];
    };
    
    // 店铺商铺
    headerView.clickAllShopAction = ^{
        __strong typeof(self) strongSelf = weakSelf;
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        IncomeDetailsController *incomeDetailsController = [[IncomeDetailsController alloc]
                                                            initWithNibName:@"IncomeDetailsController"
                                                            bundle:bundle];
        [strongSelf.navigationController pushViewController:incomeDetailsController animated:true];
    };
    
    // 师徒
    headerView.clickTeach = ^{
        __strong typeof(self) strongSelf = weakSelf;
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        TeachRewardController *teachRewardController = [[TeachRewardController alloc]
                                        initWithNibName:@"TeachRewardController"
                                        bundle:bundle];
        [strongSelf.navigationController pushViewController:teachRewardController animated:true];
    };
    
    
    
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
    }];
    
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 61, 0, 400)
                                                 style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return  _tableView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MemberCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MemberCenterCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}


@end
