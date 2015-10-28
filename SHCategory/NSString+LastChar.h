//
//  NSString+LastChar.h
//  QeeNiaoOC
//
//  Created by seanhuang on 15-01-21.
//  Copyright (c) 2015年 qeeniao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LastChar)

- (NSString *)lastChar;
- (NSString *)stringByDeleteLastChar;
- (BOOL)isNumber;
- (BOOL)isInt;
+ (NSString *)makeSystemUuid;
+ (NSString *)makeUuid;
+ (NSString *)makePathOfCaches;
- (NSString *)addDomin;

+ (NSString *)getAppVersion;

- (BOOL)containsStringIOS7:(NSString*)other;
- (NSDictionary *)toDictionary;

- (NSDate *)tryToBeDate;

+ (NSString *)getNoTailZeroStringWith:(float)floatNum;
@end