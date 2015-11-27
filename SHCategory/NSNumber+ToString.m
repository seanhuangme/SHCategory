//
//  NSNumber+ToString.m
//  Sean Huang
//
//  Created by seanhuang on 15-01-27.
//  Copyright (c) 2015年 seanhuang. All rights reserved.
//

#import "NSNumber+ToString.h"

@implementation NSNumber (ToString)

- (NSString *)toString {
    NSString *numStr;
    if ([self integerValue] == [self doubleValue]) {
        numStr = [self toIntString];
    } else {
        numStr = [self toFloatString];
    }
    
    return numStr;
}

- (NSString *)toIntString {
    NSString *numStr;
    
    numStr = [NSString stringWithFormat:@"%lld", [self longLongValue]];
    
    return numStr;
}

- (NSString *)toFloatString {
    NSString *numStr;

    numStr = [NSString stringWithFormat:@"%.2f", [self doubleValue]];
    
    return numStr;
}

- (NSString *)toFloat1String {
    NSString *numStr;
    
    numStr = [NSString stringWithFormat:@"%.1f", [self doubleValue]];
    
    return numStr;
}

- (NSString *)toFloat2String {
    NSString *numStr;
    
    numStr = [NSString stringWithFormat:@"%.2f", [self doubleValue]];
    
    return numStr;
}

+ (NSNumber *)getMtimeNumber {
    NSNumber *number = [NSNumber numberWithLongLong:floorl([[NSDate date] timeIntervalSince1970])];

    return number;
}
@end
