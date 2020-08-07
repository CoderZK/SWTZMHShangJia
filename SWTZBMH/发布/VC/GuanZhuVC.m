//
//  GuanZhuVC.m
//  SWTZBMH
//
//  Created by kunzhang on 2018/7/2.
//  Copyright © 2018年 kunzhang. All rights reserved.
//

#import "GuanZhuVC.h"
#import "SWTMineFaBuOneCell.h"
@interface GuanZhuVC ()

@end

@implementation GuanZhuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发布";
    [self.tableView registerNib:[UINib nibWithNibName:@"SWTMineFaBuOneCell" bundle:nil] forCellReuseIdentifier:@"cell"];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
- (UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SWTMineFaBuOneCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.titleLB.text = @"直播";
        cell.imgV.image = [UIImage imageNamed:@"dyx59"];
    }else {
        cell.titleLB.text = @"视频";
        cell.imgV.image = [UIImage imageNamed:@"dyx60"];
        
    }
    return cell;
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
