//
//  NSString+LastChar.m
//  Sean Huang
//
//  Created by seanhuang on 15-01-21.
//  Copyright (c) 2015年 seanhuang. All rights reserved.
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
    if ([self integerValue] == [self doubleValue]) {
        return YES;
    }
    
    return NO;
}


+ (NSString *)makeSystemUuid {
    return (NSString*)CFBridgingRelease(CFUUIDCreateString(nil, CFUUIDCreate(nil)));
}

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
    
    if ([string1 doubleValue] == [string2 doubleValue]) {
        if ([string0 doubleValue] == [string1 doubleValue]) {
            noTailZeroString = string0;
        } else {
            noTailZeroString = string1;
        }
    } else {
        noTailZeroString = string2;
    }
    
    return noTailZeroString;
}

#pragma mark -
+ (NSString *)encodeToPercentEscapeString:(NSString *)input
{
    // http://blog.csdn.net/kesalin/article/details/6678939
    
    /**
     *
     */
    // Encode all the reserved characters, per RFC 3986
    // (<http://www.ietf.org/rfc/rfc3986.txt>)
    CFStringRef tmp = CFURLCreateStringByAddingPercentEscapes(
                                                              kCFAllocatorDefault,
                                                              (CFStringRef)input,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8
                                                              );
    NSString *outputStr = (NSString *)CFBridgingRelease(tmp);

    return outputStr;
}

+ (NSString *)decodeFromPercentEscapeString:(NSString *)input
{
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [outputStr length])];
    
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
@end
