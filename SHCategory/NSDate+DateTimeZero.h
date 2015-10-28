//
//  NSDate+DateTimeZero.h
//  QeeNiaoOC
//
//  Created by seanhuang on 15-01-12.
//  Copyright (c) 2015年 qeeniao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DateTimeZero)

+ (NSDate *)dateFromString:(NSString *)dateString dateFormat:(NSString *)dateFormat;

/**
 *  Description
 *
 *  @param timestamp timestamp description
 *
 *  @return return value description
 */
+ (NSDate *)getDateTimeZeroFromTimestamp:(NSInteger)timestamp;
- (NSDate *)getDateTimeZero;
- (NSString *)getDateTimeZeroString;
- (NSString *)getDateTimeZeroStringWithZh;
- (NSString *)getDateTimeZeroStringForTail;
- (NSString *)getYearString;
- (NSString *)getDateTimeZeroStringWithSlash;

/**
 *
 */
- (BOOL)inMonthOfTimestamp:(NSTimeInterval)timestamp withCalendar:(NSCalendar *)calendar;
- (NSDate *)getMonthFirstDayWithCalendar:(NSCalendar *)calendar;
- (NSDate *)getYearFirstDayWithCalendar:(NSCalendar *)calendar;

/**
 *
 */
- (NSString *)toReadableString;
- (NSString *)toReadableStringWithMonth;
- (NSString *)toReadableStringForAccountDetail;
    
/**
 *  Description
 *
 *  @return return value description
 */
- (NSDate *)yearMonthDayForGroup;
- (NSString *)yearMonthForGroup;
- (NSString *)yearMonthForDisplay;

/**
 *  Description
 *
 *  @return return value description
 */
- (NSString *)getDateStringMonthDayZh;

/**
 *  Description
 *
 *  @return return value description
 */
- (NSString *)stringForTimelineNode;

/**
 *
 */
- (NSString *)getBeijingTimeString;

/**
 *
 */
- (NSString *)getStringWithFormatString:(NSString *)formatString;

@end
