//
//  UIColor+KDZJ.m
//  QeeNiaoOC
//
//  Created by seanhuang on 15-01-31.
//  Copyright (c) 2015年 qeeniao. All rights reserved.
//

#import "UIColor+KDZJ.h"
#import <HexColors/HexColor.h>

static inline CGFloat randomFloat()
{
    return (CGFloat)arc4random()/RAND_MAX;
}

@implementation UIColor (KDZJ)

/**
 *  Description
 *
 *  @return return value description
 */
+ (UIColor *)getRandomColor {
    CGFloat r = randomFloat();
    CGFloat g = randomFloat();
    CGFloat b = randomFloat();
    
    return [UIColor colorWithRed:r
                           green:g
                            blue:b
                           alpha:1.0];
}

/**
 *  Description
 *
 *  @return return value description
 */
+ (UIColor *)kdjzColorTableViewCellSeperateLine {
    return [UIColor colorWithHexString:@"e5e5e5"];
}

@end
