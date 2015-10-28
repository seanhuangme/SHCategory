//
//  NSDictionary+ToJsonString.m
//  QeeNiaoOC
//
//  Created by seanhuang on 15-01-27.
//  Copyright (c) 2015年 qeeniao. All rights reserved.
//

#import "NSDictionary+ToJsonString.h"
#import <UIKit/UIKit.h>

@implementation NSDictionary (ToJsonString)

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
