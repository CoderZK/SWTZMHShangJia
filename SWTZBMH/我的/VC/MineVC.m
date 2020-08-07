//
//  MineVC.m
//  SWTZBMH
//
//  Created by kunzhang on 2018/7/2.
//  Copyright © 2018年 kunzhang. All rights reserved.
//

#import "MineVC.h"
#import "SWTMJMineOneCell.h"
#import "SWTMineTwoCell.h"
#import "SWTMineThreeCell.h"
#import "SWTShopSettingTVC.h"
@interface MineVC ()
@property(nonatomic , strong)NSArray *leftArr;
@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"卖家中心";
    self.leftArr = @[@"总资产",@"拍品管理",@"产品库",@"优惠券",@"直播",@"视频"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SWTMJMineOneCell" bundle:nil] forCellReuseIdentifier:@"SWTMJMineOneCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SWTMineThreeCell" bundle:nil] forCellReuseIdentifier:@"SWTMineThreeCell"];
    [self.tableView registerClass:[SWTMineTwoCell class] forCellReuseIdentifier:@"SWTMineTwoCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    return self.leftArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 100;
        }
        return 95;
    }
    return 50;
}
- (UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if(indexPath.row == 0) {
            SWTMJMineOneCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SWTMJMineOneCell" forIndexPath:indexPath];
            cell.delegateSignal = [[RACSubject alloc] init];
            @weakify(self);
            [cell.delegateSignal subscribeNext:^(NSNumber * x) {
                @strongify(self);
                if (x.intValue == 100) {
                    //点击是编辑
                    SWTShopSettingTVC * vc =[[SWTShopSettingTVC alloc] initWithTableViewStyle:(UITableViewStyleGrouped)];
                    vc.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:vc animated:YES];
                    
                }else if (x.intValue== 101) {
                    //点击的是设置
                }
                
                
            }];
              return cell;
        }else {
            SWTMineTwoCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SWTMineTwoCell" forIndexPath:indexPath];
            return cell;
        }
    }else {
        SWTMineThreeCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SWTMineThreeCell" forIndexPath:indexPath];
        cell.leftLB.text = self.leftArr[indexPath.row];
        cell.leftImgV.image = [UIImage imageNamed: [NSString stringWithFormat:@"dyx%d",11+indexPath.row]];
        return cell;
    }
  
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
