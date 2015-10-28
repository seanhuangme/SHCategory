//
//  UIViewController+AppDelegate.h
//  QeeNiaoOC
//
//  Created by seanhuang on 14-12-23.
//  Copyright (c) 2014年 qeeniao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeanTopBar.h"

@interface UIViewController (AppDelegate)
@property (strong, nonatomic) UIView *maskViewSean;
@property (nonatomic, readonly) SeanTopBar *topBar;

//@property (nonatomic, readonly) float widthFactor;
//@property (nonatomic, readonly) float heightFactor;

- (void)initTopBar;
@end
