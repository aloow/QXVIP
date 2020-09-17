//
//  TypeSelectView.m
//  QXMember
//
//  Created by iMac on 2020/9/9.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "TypeSelectView.h"
#import <Masonry/Masonry.h>
#import "YYCategories.h"

// MARK: MenuCollectionCell
@implementation MenuCollectionCell

- (UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.font = [UIFont systemFontOfSize:14];
        _textLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_textLabel];
        [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.left.top.offset(0);
        }];
    }
    return _textLabel;
}

@end


// MARK: TypeSelectView
typedef NS_ENUM(NSInteger,Select)
{
    SelectTime,
    SelectType,
    SelectNone,
};

typedef struct {
    Select select;
    NSInteger index;
} State;

@interface TypeSelectView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *timeButton;

@property (weak, nonatomic) IBOutlet UIButton *typeButton;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, assign) NSInteger selectTimeIndex;
@property (nonatomic, assign) NSInteger selectTypeIndex;

@property (nonatomic,assign) Select select;
@property (nonatomic,assign) State oldState;

@property (nonatomic, strong) NSArray<NSString*> *timesList;
@property (nonatomic, strong) NSArray<NSString*> *typesList;


@end


@implementation TypeSelectView

- (void)setupView {
    [self.collectionView registerClass:[MenuCollectionCell class]
            forCellWithReuseIdentifier:@"menucell"];
    [self.collectionView setHidden:YES];
    
    self.backgroundColor = UIColor.clearColor;
    
    self.timesList = @[@"不限时间",@"今天",@"昨天",@"近7天",@"近30天",@"自定义"];
    self.typesList = @[@"不限类型",@"自购",@"推广",@"店铺"];
    
    self.selectTimeIndex = 0;
    self.selectTypeIndex = 0;
    
    State state = {SelectNone,0};
    self.oldState = state;
}
// MARK: User Touch
- (IBAction)timeBntTap:(UIButton *)sender {
    
    [self getOldState:self.oldState select:SelectTime
                  tap:self.selectTimeIndex];
    
}

- (IBAction)tpyeBntTap:(UIButton *)sender {
    
    [self getOldState:self.oldState select:SelectType
    tap:self.selectTypeIndex];
    
}

// MARK: Help Methods
- (void)updateCollectionView:(BOOL)isHide {
    [self.collectionView setHidden:isHide];
    [self.collectionView reloadData];
}

// 状态处理
- (void)getOldState:(State)oldState select:(Select)select tap:(NSInteger)index {

    BOOL isHidCollectionView = false;
    
    switch (oldState.select) {
        case SelectNone: // 初始状态
            isHidCollectionView = false;
            if (select == SelectTime) {
                [self.timeButton setTitleColor:[UIColor colorWithHexString:@"#FF9912"]
                forState:UIControlStateNormal];
            } else {
                [self.typeButton setTitleColor:[UIColor colorWithHexString:@"#FF9912"]
                forState:UIControlStateNormal];
            }
            break;
        case SelectTime: // 已选择Time
            if (select == SelectNone ) { // 选择了collection中选项
                [self.timeButton setTitle:self.timesList[index]
                                 forState:UIControlStateNormal];
                self.selectTimeIndex = index;
                [self.timeButton setTitleColor:[UIColor colorWithHexString:@"#2E2E2E"]
                forState:UIControlStateNormal];
                
                isHidCollectionView = true;
                select = SelectNone;
            } else if (select == SelectTime) { // 选择了时间或者类型
                isHidCollectionView = true;
                [self.timeButton setTitleColor:[UIColor colorWithHexString:@"#2E2E2E"]
                forState:UIControlStateNormal];
                select = SelectNone;
            } else { // 切换到了类型
                [self.timeButton setTitleColor:[UIColor colorWithHexString:@"#2E2E2E"]
                forState:UIControlStateNormal];
                [self.typeButton setTitleColor:[UIColor colorWithHexString:@"#FF9912"]
                forState:UIControlStateNormal];
            }
            break;
        case SelectType: // 已选择Type
            if (select == SelectNone ) { // 选择了collection中选项
                [self.typeButton setTitle:self.typesList[index]
                                 forState:UIControlStateNormal];
                self.selectTypeIndex = index;
                [self.typeButton setTitleColor:[UIColor colorWithHexString:@"#2E2E2E"]
                forState:UIControlStateNormal];
                
                isHidCollectionView = true;
                select = SelectNone;
            } else if (select == SelectType) { // 选择了时间或者类型
                isHidCollectionView = true;
                [self.typeButton setTitleColor:[UIColor colorWithHexString:@"#2E2E2E"]
                forState:UIControlStateNormal];
                select = SelectNone;
            } else { // 切换到了时间
                [self.timeButton setTitleColor:[UIColor colorWithHexString:@"#FF9912"]
                forState:UIControlStateNormal];
                [self.typeButton setTitleColor:[UIColor colorWithHexString:@"#2E2E2E"]
                forState:UIControlStateNormal];
            }
            break;
        default:
            break;
    }
    
    State state = {select,index};
    self.oldState = state;

    [self updateCollectionView:isHidCollectionView];
    
}

// MARK: - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    switch (self.oldState.select) {
        case SelectNone:
            return 1;
            break;
        case SelectTime:
            return self.timesList.count;
            break;
        case SelectType:
            return self.typesList.count;
            break;
        default:
            return 0;
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MenuCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"menucell"
                                 forIndexPath:indexPath];

    NSInteger selectIndex = 0;
    NSMutableArray *titles = @[].mutableCopy;
    if (self.oldState.select == SelectTime) {
        titles = self.timesList.mutableCopy;
        selectIndex = self.selectTimeIndex;
    } else {
        titles = self.typesList.mutableCopy;
        selectIndex = self.selectTypeIndex;
    }
    if (selectIndex == indexPath.row) {
        cell.contentView.backgroundColor = [UIColor colorWithHexString:@"0xFFF5E7"];
        cell.textLabel.textColor = [UIColor colorWithHexString:@"0xFF9912"];;
    } else {
        cell.contentView.backgroundColor = [UIColor colorWithHexString:@"#F5F5F5"];
        cell.textLabel.textColor = [UIColor colorWithHexString:@"#2E2E2E"];;
    }
    cell.textLabel.text = titles[indexPath.row];
    cell.contentView.layer.masksToBounds = YES;
    cell.contentView.layer.cornerRadius = 4.f;
    return cell;
    
}

// MARK: - Collection View Flow Layout Delegate
/// cell大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 50)/4;
    CGFloat higth = 32;
    return CGSizeMake(width, higth);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 10, 5, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 20.f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.f;
}


// MARK: - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView
    didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [self getOldState:self.oldState select:SelectNone
                  tap:indexPath.row];

}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    UIView *hitView = [super hitTest:point withEvent:event];
    if (hitView == self.view) {
        return nil;
    }
    return hitView;
    
}

@end


