//
//  UIFont+SytemFontOverride.m
//  Sean Huang
//
//  Created by seanhuang on 15-01-14.
//  Copyright (c) 2015年 seanhuang. All rights reserved.
//

#import "UIFont+SytemFontOverride.h"
#import <objc/runtime.h>

NSString *const FORegularFontName = @"FZLTXHK--GBK1-0";
NSString *const FOBoldFontName = @"FZLTXHK--GBK1-0";
//NSString *const FOBoldFontName = @"FZLTZHUNHJW--GB1-0";
//NSString *const FOBoldFontName = @"STHeitiSC-Medium";
NSString *const FOItalicFontName = @"FZLTXHK--GBK1-0";

@implementation UIFont (SytemFontOverride)

//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
//
//+ (UIFont *)boldSystemFontOfSize:(CGFloat)fontSize {
//    return [UIFont fontWithName:@"fontName" size:fontSize];
//}
//
//+ (UIFont *)systemFontOfSize:(CGFloat)fontSize {
//    return [UIFont fontWithName:@"fontName" size:fontSize];
//}
//
//#pragma clang diagnostic pop

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
+ (void)replaceClassSelector:(SEL)originalSelector withSelector:(SEL)modifiedSelector {
    Method originalMethod = class_getClassMethod(self, originalSelector);
    Method modifiedMethod = class_getClassMethod(self, modifiedSelector);
    method_exchangeImplementations(originalMethod, modifiedMethod);
}

+ (void)replaceInstanceSelector:(SEL)originalSelector withSelector:(SEL)modifiedSelector {
    Method originalDecoderMethod = class_getInstanceMethod(self, originalSelector);
    Method modifiedDecoderMethod = class_getInstanceMethod(self, modifiedSelector);
    method_exchangeImplementations(originalDecoderMethod, modifiedDecoderMethod);
}

+ (UIFont *)regularFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:FORegularFontName size:size];
}

+ (UIFont *)boldFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:FOBoldFontName size:size];
}

+ (UIFont *)italicFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:FOItalicFontName size:fontSize];
}

- (id)initCustomWithCoder:(NSCoder *)aDecoder {
    BOOL result = [aDecoder containsValueForKey:@"UIFontDescriptor"];
    
    if (result) {
        UIFontDescriptor *descriptor = [aDecoder decodeObjectForKey:@"UIFontDescriptor"];
        
        NSString *fontName;
        if ([descriptor.fontAttributes[@"NSCTFontUIUsageAttribute"] isEqualToString:@"CTFontRegularUsage"]) {
            fontName = FORegularFontName;
        }
        else if ([descriptor.fontAttributes[@"NSCTFontUIUsageAttribute"] isEqualToString:@"CTFontEmphasizedUsage"]) {
            fontName = FOBoldFontName;
        }
        else if ([descriptor.fontAttributes[@"NSCTFontUIUsageAttribute"] isEqualToString:@"CTFontObliqueUsage"]) {
            fontName = FOItalicFontName;
        }
        else {
            fontName = descriptor.fontAttributes[@"NSFontNameAttribute"];
        }
        
        return [UIFont fontWithName:fontName size:descriptor.pointSize];
    }
    
    self = [self initCustomWithCoder:aDecoder];
    
    return self;
}

+ (void)load
{
    [self replaceClassSelector:@selector(systemFontOfSize:) withSelector:@selector(regularFontWithSize:)];
    [self replaceClassSelector:@selector(boldSystemFontOfSize:) withSelector:@selector(boldFontWithSize:)];
    [self replaceClassSelector:@selector(italicSystemFontOfSize:) withSelector:@selector(italicFontOfSize:)];
    
    [self replaceInstanceSelector:@selector(initWithCoder:) withSelector:@selector(initCustomWithCoder:)];
}
#pragma clang diagnostic pop

@end