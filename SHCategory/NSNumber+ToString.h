//
//  NSNumber+ToString.h
//  QeeNiaoOC
//
//  Created by seanhuang on 15-01-27.
//  Copyright (c) 2015年 qeeniao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (ToString)

- (NSString *)toString;
- (NSString *)toIntString;
- (NSString *)toFloatString;
- (NSString *)toFloat1String;
- (NSString *)toFloat2String;
+ (NSNumber *)getMtimeNumber;
@end
