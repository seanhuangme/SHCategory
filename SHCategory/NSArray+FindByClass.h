//
//  NSArray+FindByClass.h
//  Sean Huang
//
//  Created by seanhuang on 15-01-27.
//  Copyright (c) 2015年 seanhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (FindByClass)

- (id)findByClass:(Class)classType;
- (NSString *)toJsonString;
@end
