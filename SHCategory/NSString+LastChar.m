//
//  NSString+LastChar.m
//  QeeNiaoOC
//
//  Created by seanhuang on 15-01-21.
//  Copyright (c) 2015年 qeeniao. All rights reserved.
//

#import "NSString+LastChar.h"

@implementation NSString (LastChar)

- (NSString *)lastChar {
    if (self.length == 0) {
        return @"";
    }
    
    return [self substringFromIndex:self.length - 1];
}

- (NSString *)stringByDeleteLastChar {
    if (self.length == 0) {
        return @"";
    }
    
    return [self substringToIndex:self.length - 1];
}
    
- (BOOL)isNumber {
    if ([self integerValue] > 0) {
        return YES;
    }
    
    if ([self isEqualToString:@"0"]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isInt {
    if ([self integerValue] == [self floatValue]) {
        return YES;
    }
    
    return NO;
}


+ (NSString *)makeSystemUuid {
    return (NSString*)CFBridgingRelease(CFUUIDCreateString(nil, CFUUIDCreate(nil)));
}

//+ (NSString *)makeUuid {
//    // -------------------------------------------------------------------------
//    // -------------------------------------------------------------------------
//    int lastID = [[NSUserDefaults standardUserDefaults] integerForKey:@"QeeNiao#AutoIncrementID"];
//
//    // -------------------------------------------------------------------------
//    // -------------------------------------------------------------------------
//    NSDate *dateNow = [NSDate dateWithTimeIntervalSinceNow:0];
//    NSTimeInterval timestampNow = [dateNow timeIntervalSince1970];
//
//    int newID = 0;
//    if ((int)timestampNow <= lastID) {
//        newID = lastID + 1;
//    } else {
//        newID = (int)timestampNow;
//    }
//    
//    [[NSUserDefaults standardUserDefaults] setInteger:newID forKey:@"QeeNiao#AutoIncrementID"];
//
//    NSString *timeString = [NSString stringWithFormat:@"%d", newID];
//    
//    return timeString;
//}

+ (NSString *)makeUuid {
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    NSDate *dateNow = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval timestampNow = [dateNow timeIntervalSince1970];
    
    NSString *timeString = [NSString stringWithFormat:@"%lld", (int64_t)(timestampNow * 1000)];
    
    return timeString;
}

+ (NSString *)makePathOfCaches {
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    //    NSString *cachesPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    //    NSString *cachesPath = @"Library/Caches";
//    NSLog(@"%@", cachesPath);

    return cachesPath;
}

+ (NSString *)getAppVersion {
    //    NSString *shortVersion = [(NSDictionary *)CFBundleGetInfoDictionary(CFBundleGetMainBundle()) valueForKey:@"CFBundleShortVersionString"];
    
    NSDictionary *dict = (NSDictionary *)CFBundleGetInfoDictionary(CFBundleGetMainBundle());
    NSLog(@"%@", dict);
    NSString *shortVersion = [dict valueForKey:@"CFBundleShortVersionString"];
    
    return shortVersion;
}

- (BOOL)containsStringIOS7:(NSString*)other {
    NSRange range = [self rangeOfString:other];
    return range.length != 0;
}

- (NSDictionary *)toDictionary {
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    NSError *error;
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                     options:NSJSONReadingMutableContainers
                                                       error:&error];
    
    if (error) {
        return nil;
    }
    
    return dict;
}

- (NSDate *)tryToBeDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *destDate= [dateFormatter dateFromString:self];
    
    return destDate;
}

#pragma mark -
+ (NSString *)getNoTailZeroStringWith:(float)floatNum {
    NSString *noTailZeroString = @"";
    
    NSString *string0 = [NSString stringWithFormat:@"%.0f", floatNum];
    NSString *string1 = [NSString stringWithFormat:@"%.1f", floatNum];
    NSString *string2 = [NSString stringWithFormat:@"%.2f", floatNum];
    
    if ([string1 floatValue] == [string2 floatValue]) {
        if ([string0 floatValue] == [string1 floatValue]) {
            noTailZeroString = string0;
        } else {
            noTailZeroString = string1;
        }
    } else {
        noTailZeroString = string2;
    }
    
    return noTailZeroString;
}

@end
