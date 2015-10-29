//
//  NSString+LastChar.h
//  Sean Huang
//
//  Created by seanhuang on 15-01-21.
//  Copyright (c) 2015年 seanhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNull (Trick)
- (NSUInteger)length;
- (NSInteger)integerValue;
- (float)floatValue;
- (NSString *)description;
- (NSArray *)componentsSeparatedByString:(NSString *)separator;
- (id)objectForKey:(id)key;
- (BOOL)boolValue;
- (long long)longLongValue;
@end