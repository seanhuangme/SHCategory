//
//  NSArray+FindByClass.m
//  QeeNiaoOC
//
//  Created by seanhuang on 15-01-27.
//  Copyright (c) 2015年 qeeniao. All rights reserved.
//

#import "NSArray+FindByClass.h"
#import <UIKit/UIKit.h>

@implementation NSArray (FindByClass)

- (id)findByClass:(Class)classType {
    id ret;
    
    for (id anVC in self) {
        if ([anVC isKindOfClass:classType]) {
            ret = anVC;
            break;
        }
    }
    
    return ret;
}

- (NSString *)toJsonString {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:(NSJSONWritingPrettyPrinted)
                                                         error:&error];
    
    NSString *jsonString = nil;
    if (!jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    return jsonString;
}
@end
