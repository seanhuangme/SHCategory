//
//  UIView+Superview.h
//  QeeNiaoOC
//
//  Created by seanhuang on 14-12-29.
//  Copyright (c) 2014年 qeeniao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Superview)
@property (strong, nonatomic) NSDictionary *dict;

- (UIView *)findSuperviewWithClass:(Class)superviewClass;
- (void)addLineBottomColor:(UIColor *)borderColor
                     Width:(NSInteger)borderWidth;
- (void)addLineLeftWithColor:(UIColor *)borderColor
                       Width:(NSInteger)borderWidth;
- (void)addLineRightWithColor:(UIColor *)borderColor
                       Width:(NSInteger)borderWidth;

@end


