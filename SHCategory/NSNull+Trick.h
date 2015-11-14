//
//  NSString+LastChar.h
//  Sean Huang
//
//  Created by seanhuang on 15-01-21.
//  Copyright (c) 2015年 seanhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNull (Trick)

#pragma mark - xxxValue
- (NSInteger)integerValue;
- (float)floatValue;
- (double)doubleValue;
- (BOOL)boolValue;
- (long long)longLongValue;

#pragma mark -
- (NSUInteger)length;
- (NSString *)description;
- (NSArray *)componentsSeparatedByString:(NSString *)separator;
- (id)objectForKey:(id)key;
@end