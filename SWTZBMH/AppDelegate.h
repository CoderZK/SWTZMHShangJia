//
//  AppDelegate.h
//  SWTZBMH
//
//  Created by kunzhang on 2018/7/2.
//  Copyright © 2018年 kunzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)showHomeVC;

@property(nonatomic,strong)NSData * pushToken;

@end

