//
//  UIImage+FixOrientation.h
//  Sean Huang
//
//  Created by seanhuang on 15-02-06.
//  Copyright (c) 2015年 seanhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FixOrientation)

- (UIImage *)fixOrientation;
+ (UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect;

- (UIImage *)getImageAdaptSize:(CGSize)sizeNew;
@end
