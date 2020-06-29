//
//  BaseViewController.m
//  kunzhang
//
//  Created by kunzhang on 16/10/13.
//  Copyright © 2016年 kunzhang. All rights reserved.
//

#import "BaseViewController.h"
//#import "LogionTVC.h"
typedef void (^Nav)(UIButton *);
typedef void (^Nav2)();

@interface BaseViewController ()
@property (nonatomic, copy)Nav2 leftBlock2;
@property (nonatomic, copy)Nav2 rightBlock2;
@end
@implementation BaseViewController

- (BOOL)shouldAutorotate
{
    return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"";
    [backItem setBackButtonBackgroundImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    self.navigationItem.backBarButtonItem=backItem;
}


//左侧导航条按钮点击
-(void)setNavLeftBtnWithImg:(NSString *)imgName title:(NSString *)title withBlock:(void (^)(UIButton *leftBtn))leftBtn handleBtn:(void (^)())butnClick{
    
    UIButton *leftBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn2.frame = CGRectMake(- 20 , 0 , 44 , 44 );
    if (imgName!=nil&&imgName.length>0&&title!=nil&&title.length>0) {
        leftBtn2.frame = CGRectMake(-20, 0, 110, 44);
        leftBtn2.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    }
    imgName = imgName==nil||[imgName isEqual:[NSNull null]]?@"返回":imgName;
    title = title==nil||[title isEqual:[NSNull null]]?@"":title;
    leftBtn2.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [leftBtn2 addTarget : self action : @selector (tapLeftBtn) forControlEvents : UIControlEventTouchUpInside ];//设置按钮点击事件
    [leftBtn2 setTitle:[NSString stringWithFormat:@"%@",title] forState:UIControlStateNormal];
    [leftBtn2 setImage :[UIImage imageNamed:imgName] forState : UIControlStateNormal]; //设置按钮正常状态图片
    [leftBtn2 setImage :[UIImage imageNamed:imgName] forState : UIControlStateSelected ];//设置按钮选中图片
    //    //NSLog(@"+++++++%@",leftBtn2.titleLabel.text);
    UIBarButtonItem *leftBarButon2 = [[ UIBarButtonItem alloc ] initWithCustomView :leftBtn2];
    if (([[[ UIDevice currentDevice ] systemVersion ] floatValue ]>= 7.0 ? 20 : 0 ))
    {
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc ]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                           target : nil
                                           action : nil ];
        negativeSpacer. width = - 20 ;//这个数值可以根据情况自由变化
        self.navigationItem.leftBarButtonItems = @[ negativeSpacer, leftBarButon2 ] ;
       
    } else{
        self.navigationItem.leftBarButtonItem = leftBarButon2;
    }
    
    if (leftBtn) {
        leftBtn(leftBtn2);
    }
    
    self.leftBlock2 = butnClick;
}

//右侧点击按钮
-(void)setNavRightBtnWithImg:(NSString *)imgName title:(NSString *)title withBlock:(void (^)(UIButton *rightBtn))rightBtn handleBtn:(void (^)())butnClick{
    _rightBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn2.frame = CGRectMake(-20 , 0 , 60 , 44 );
    if (imgName!=nil&&imgName.length>0&&title!=nil&&title.length>0) {
        _rightBtn2.frame = CGRectMake(-20, 0, 110, 44);
        _rightBtn2.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    }
    title = title==nil||[title isEqual:[NSNull null]]?@"":title;
    [_rightBtn2 addTarget : self action : @selector (tapRightBtn) forControlEvents : UIControlEventTouchUpInside ];//设置按钮点击事件
    [_rightBtn2 setTitle:title forState:UIControlStateNormal];
    _rightBtn2.titleLabel.font = [UIFont systemFontOfSize:14];
    [_rightBtn2 setImage :[UIImage imageNamed:imgName] forState : UIControlStateNormal]; //设置按钮正常状态图片
    [_rightBtn2 setImage :[UIImage imageNamed:imgName] forState : UIControlStateSelected ];//设置按钮选中图片
    UIBarButtonItem *rightBarButon2 = [[ UIBarButtonItem alloc ] initWithCustomView:_rightBtn2];
    if (([[[ UIDevice currentDevice ] systemVersion ] floatValue ]>= 7.0 ? 20 : 0 ))
    {
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc ]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                           target : nil
                                           action : nil ];
        negativeSpacer. width = - 5 ;//这个数值可以根据情况自由变化
        self.navigationItem.rightBarButtonItems = @[ negativeSpacer, rightBarButon2 ] ;
        
    } else{
        self.navigationItem.leftBarButtonItem = rightBarButon2;
    }
    
    rightBtn(_rightBtn2);
    
    self.rightBlock2 = butnClick;
}



//- (void)gotoLoginVC {
//    
//    LogionTVC * vc =[[LogionTVC alloc] init];
//    BaseNavigationController * navc =[[BaseNavigationController alloc] initWithRootViewController:vc];;
//    [self presentViewController:navc animated:YES completion:nil];
//    
//    
//}

@end
