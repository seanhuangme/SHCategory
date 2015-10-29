//
//  UIScreen+RatioAdaptor.h
//  Sean Huang
//
//  Created by seanhuang on 15-01-29.
//  Copyright (c) 2015年 seanhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (RatioAdaptor)

+ (float)adaptWidth:(NSInteger)width;
+ (float)adaptHeight:(NSInteger)height;
+ (float)adaptWidthBase5:(NSInteger)width;
+ (float)adaptHeightBase5:(NSInteger)height;
+ (float)adaptWidthBase6:(NSInteger)width;
+ (float)adaptHeightBase6:(NSInteger)height;
+ (float)adaptWidthBase6p:(NSInteger)width;
+ (float)adaptHeightBase6p:(NSInteger)height;


+ (float)widthFactor;
+ (float)heightFactor;
+ (float)widthFactorBase6;
+ (float)heightFactorBase6;
+ (float)widthFactorBase6p;
+ (float)heightFactorBase6p;

@end
