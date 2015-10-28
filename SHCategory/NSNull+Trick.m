
#import "NSNull+Trick.h"

@implementation NSNull (Trick)

- (NSUInteger)length {
    return 0;
}

- (NSInteger)integerValue {
    return 0;
};

- (float)floatValue {
    return 0;
};

- (NSString *)description {
    return @"0(NSNull)";
}

- (NSArray *)componentsSeparatedByString:(NSString *)separator {
    return @[];
}

- (id)objectForKey:(id)key {
    return nil;
}

- (BOOL)boolValue {
    return NO;
}

- (long long)longLongValue {
    return 0;
}
@end