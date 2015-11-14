
#import "NSNull+Trick.h"

@implementation NSNull (Trick)

#pragma mark - xxxValue
- (NSInteger)integerValue {
    return 0;
};

- (float)floatValue {
    return 0;
};

- (double)doubleValue {
    return 0;
};

- (BOOL)boolValue {
    return NO;
}

- (long long)longLongValue {
    return 0;
}

#pragma mark -
- (NSUInteger)length {
    return 0;
}

- (NSString *)description {
    return @"0(NSNull)";
}

- (NSArray *)componentsSeparatedByString:(NSString *)separator {
    return @[];
}

- (id)objectForKey:(id)key {
    return nil;
}


@end