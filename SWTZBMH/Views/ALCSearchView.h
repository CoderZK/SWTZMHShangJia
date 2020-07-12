//
//  ALCSearchView.h
//  AnLanCustomers
//
//  Created by zk on 2020/3/24.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALCSearchView : UIView
@property(nonatomic,strong)UITextField *searchTF;
@property(nonatomic , strong)UIImageView *imgView;
@property(nonatomic,assign)BOOL isPush;
@property(nonatomic,strong)UIButton *clickBt;
@property(nonatomic,assign)BOOL isBlack;
@end

NS_ASSUME_NONNULL_END
