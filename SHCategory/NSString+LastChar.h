//
//  NSString+LastChar.h
//  Sean Huang
//
//  Created by seanhuang on 15-01-21.
//  Copyright (c) 2015年 seanhuang. All rights reserved.
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

/**
 *
 */
+ (NSString *)encodeToPercentEscapeString:(NSString *)input;
+ (NSString *)decodeFromPercentEscapeString:(NSString *)input;
@end
