//
//  NSDate+DateTimeZero.m
//  QeeNiaoOC
//
//  Created by seanhuang on 15-01-12.
//  Copyright (c) 2015年 qeeniao. All rights reserved.
//

#import "NSDate+DateTimeZero.h"

@implementation NSDate (DateTimeZero)

+ (NSDate *)dateFromString:(NSString *)dateString dateFormat:(NSString *)dateFormat {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = dateFormat;
    NSDate *date = [df dateFromString:dateString];

    return date;
}

/**
 *  Description
 *
 *  @param timestamp timestamp description
 *
 *  @return return value description
 */
- (BOOL)inMonthOfTimestamp:(NSTimeInterval)timestamp withCalendar:(NSCalendar *)calendar {
    NSDateComponents* comp1 = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit fromDate:self];
    NSDateComponents* comp2 = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit fromDate:[NSDate dateWithTimeIntervalSince1970:timestamp]];
    
    BOOL dateInMonth = (comp1.year == comp2.year && comp1.month == comp2.month);
    
    return dateInMonth;
}

- (NSDate *)getMonthFirstDayWithCalendar:(NSCalendar *)calendar {
    NSDateComponents *components = [calendar components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit) fromDate:self];
    components.day = 1;
    NSDate *dayOneInCurrentMonth = [calendar dateFromComponents:components];
    
    return dayOneInCurrentMonth;
}

- (NSDate *)getYearFirstDayWithCalendar:(NSCalendar *)calendar {
    NSDateComponents *components = [calendar components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit) fromDate:self];
    components.month = 1;
    components.day = 1;
    NSDate *dayOneInCurrentMonth = [calendar dateFromComponents:components];
    
    return dayOneInCurrentMonth;
}

/**
 *  Description
 *
 *  @param timestamp timestamp description
 *
 *  @return return value description
 */
+ (NSDate *)getDateTimeZeroFromTimestamp:(NSInteger)timestamp {
    NSInteger timestampNew = (timestamp + 8 * 3600) - (timestamp + 8 * 3600) % 86400;
    NSDate *date00 = [NSDate dateWithTimeIntervalSince1970:timestampNew];
    
    return date00;
}

- (NSDate *)getDateTimeZero {
    NSInteger timestamp = [self timeIntervalSince1970];
    NSDate *date00 = [NSDate getDateTimeZeroFromTimestamp:timestamp];
    
    return date00;
}

/**
 *  Description
 *
 *  @param formatString formatString description
 *
 *  @return return value description
 */
- (NSString *)getStringWithFormatString:(NSString *)formatString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    [formatter setDateFormat:formatString];
    
    NSString *dateTimeZeroString = [formatter stringFromDate:self];

    return dateTimeZeroString;
}

/**
 *  Description
 *
 *  @return return value description
 */
- (NSString *)getDateTimeZeroString {
    NSString *dateTimeZeroString = [self getStringWithFormatString:@"yyyy-MM-dd"];

    return dateTimeZeroString;
}

- (NSString *)getDateTimeZeroStringWithZh {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    [formatter setDateFormat:@"yyyy年M月d日"];
    
    NSString *dateTimeZeroString = [formatter stringFromDate:self];
    
    return dateTimeZeroString;
}

/**
 *  Description
 *
 *  @return return value description
 */
- (NSString *)getDateStringMonthDayZh {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    [formatter setDateFormat:@"M月d日"];
    
    NSString *dateTimeZeroString = [formatter stringFromDate:self];
    
    return dateTimeZeroString;
}

- (NSString *)getDateTimeZeroStringForTail {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    [formatter setDateFormat:@"M月d日H时m分"];
    
    NSString *dateTimeZeroString = [formatter stringFromDate:self];
    
    return dateTimeZeroString;
}

- (NSString *)getYearString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    [formatter setDateFormat:@"yyyy"];
    
    NSString *dateTimeZeroString = [formatter stringFromDate:self];
    
    return dateTimeZeroString;
}

- (NSString *)getDateTimeZeroStringWithSlash {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    
    NSString *dateTimeZeroString = [formatter stringFromDate:self];
    
    return dateTimeZeroString;
}

#pragma mark -
- (NSString *)toReadableStringWithMonth {
    NSString *readableString;
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:-1];
    //NSDate *yesterday = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:[NSDate date] options:0];

    
//    if ([[self getDateTimeZeroString] isEqualToString:[[NSDate date] getDateTimeZeroString]]) {
//        return @"今天";
//    } else if ([[self getDateTimeZeroString] isEqualToString:[yesterday getDateTimeZeroString]]) {
//        return @"昨天";
//    } else {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
        [formatter setDateFormat:@"MM月dd日"];
        
        NSString *dateTimeZeroString = [formatter stringFromDate:self];

        return dateTimeZeroString;
//    }
    
    return readableString;
}

- (NSString *)toReadableStringForAccountDetail {
    NSString *readableString;
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:-1];
    NSDate *yesterday = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:[NSDate date] options:0];
    
    
    if ([[self getDateTimeZeroString] isEqualToString:[[NSDate date] getDateTimeZeroString]]) {
        return @"今天";
    } else if ([[self getDateTimeZeroString] isEqualToString:[yesterday getDateTimeZeroString]]) {
        return @"昨天";
    } else {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
        [formatter setDateFormat:@"MM月dd日"];
        
        NSString *dateTimeZeroString = [formatter stringFromDate:self];
        
        return dateTimeZeroString;
    }
    
    return readableString;
}

- (NSString *)toReadableString {
    NSString *readableString;
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:-1];
    NSDate *yesterday = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:[NSDate date] options:0];
    
    
    if ([[self getDateTimeZeroString] isEqualToString:[[NSDate date] getDateTimeZeroString]]) {
        return @"今天";
    } else if ([[self getDateTimeZeroString] isEqualToString:[yesterday getDateTimeZeroString]]) {
        return @"昨天";
    } else {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
        [formatter setDateFormat:@"d日"];
        
        NSString *dateTimeZeroString = [formatter stringFromDate:self];
        
        return dateTimeZeroString;
    }
    
    return readableString;
}

#pragma mark -
- (NSDate *)yearMonthDayForGroup {
    //    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    //[formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    //    [formatter setDateFormat:@"yyyy-MM-dd"];
    //    NSString *yearMonthDayForGroup = [formatter stringFromDate:self];
    //    NSDate *dateForYearMonthDay = [formatter dateFromString:yearMonthDayForGroup];
    return [[NSDate date] getDateTimeZero];
}

- (NSString *)yearMonthForGroup {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    
    [formatter setDateFormat:@"yyyy-MM"];
    NSString *yearMonthForGroup = [formatter stringFromDate:self];
    
    return yearMonthForGroup;
}

- (NSString *)yearMonthForDisplay {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    
    [formatter setDateFormat:@"M月"];
    NSString *yearMonthForDisplay = [formatter stringFromDate:self];
    
    return yearMonthForDisplay;
}

#pragma mark -
- (NSString *)stringForTimelineNode {
    NSString *dayForDisplay;
    
    /**
     *
     */
    if ([[self getDateTimeZero] timeIntervalSince1970] == [[[NSDate date] getDateTimeZero] timeIntervalSince1970]) {
        dayForDisplay = @"今天";
    } else if ([[self getDateTimeZero] timeIntervalSince1970] == [[[NSDate date] getDateTimeZero] timeIntervalSince1970] - 86400) {
        dayForDisplay = @"昨天";
    } else {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
        
        [formatter setDateFormat:@"d日"];
        dayForDisplay = [formatter stringFromDate:self];
    }
    
    /**
     *
     */
    
    return dayForDisplay;
}

#pragma mark -
- (NSString *)getBeijingTimeString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *beijingTimeString = [formatter stringFromDate:self];
    
    return beijingTimeString;
}

@end
