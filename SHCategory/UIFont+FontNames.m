//
//  UIFont+SytemFontOverride.m
//  QeeNiaoOC
//
//  Created by seanhuang on 15-01-14.
//  Copyright (c) 2015年 qeeniao. All rights reserved.
//

#import "UIFont+FontNames.h"

@implementation UIFont (FontNames)
+ (void)printFontNames {
    /**
     *
     */
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames ){
        printf( "\nFamily: %s\n", [familyName UTF8String] );
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];

        for( NSString *fontName in fontNames ){
            printf( "     Font\n: %s\n", [fontName UTF8String] );
        }  
    }
}
@end