//
//  UIScreen+RatioAdaptor.m
//  QeeNiaoOC
//
//  Created by seanhuang on 15-01-29.
//  Copyright (c) 2015年 qeeniao. All rights reserved.
//

#import "UIScreen+RatioAdaptor.h"

@implementation UIScreen (RatioAdaptor)

+ (float)adaptWidth:(NSInteger)width {
    return floor(width * [UIScreen widthFactor]);
}

+ (float)adaptHeight:(NSInteger)height {
    return floor(height * [UIScreen heightFactor]);
}

+ (float)adaptWidthBase5:(NSInteger)width {
    return floor(width * [UIScreen widthFactorBase5]);
}

+ (float)adaptHeightBase5:(NSInteger)height {
    return floor(height * [UIScreen heightFactorBase5]);
}

+ (float)adaptWidthBase6:(NSInteger)width {
    return floor(width * [UIScreen widthFactorBase6]);
}

+ (float)adaptHeightBase6:(NSInteger)height {
    return floor(height * [UIScreen heightFactorBase6]);
}

+ (float)adaptWidthBase6p:(NSInteger)width {
    return floor(width * [UIScreen widthFactorBase6p]);
}

+ (float)adaptHeightBase6p:(NSInteger)height {
    return floor(height * [UIScreen heightFactorBase6p]);
}

#pragma mark -
+ (float)widthFactor {
    NSInteger designScreenWidth = 320;
    return ([UIScreen mainScreen].bounds.size.width * 1.00)/designScreenWidth;
}

+ (float)heightFactor {
    NSInteger designScreenWidth = 480;
    return ([UIScreen mainScreen].bounds.size.height * 1.00)/designScreenWidth;
}

#pragma mark -
+ (float)widthFactorBase5 {
    NSInteger designScreenWidth = 320;
    return ([UIScreen mainScreen].bounds.size.width * 1.00)/designScreenWidth;
}

+ (float)heightFactorBase5 {
    NSInteger designScreenWidth = 568;
    return ([UIScreen mainScreen].bounds.size.height * 1.00)/designScreenWidth;
}

#pragma mark -
+ (float)widthFactorBase6 {
    NSInteger designScreenWidth = 375;
    return ([UIScreen mainScreen].bounds.size.width * 1.00)/designScreenWidth;
}

+ (float)heightFactorBase6 {
    NSInteger designScreenWidth = 667;
    return ([UIScreen mainScreen].bounds.size.height * 1.00)/designScreenWidth;
}

#pragma mark -
+ (float)widthFactorBase6p {
    NSInteger designScreenWidth = 414;
    return ([UIScreen mainScreen].bounds.size.width * 1.00)/designScreenWidth;
}

+ (float)heightFactorBase6p {
    NSInteger designScreenWidth = 736;
    return ([UIScreen mainScreen].bounds.size.height * 1.00)/designScreenWidth;
}

@end
