//
//  UIView+Superview.m
//  Sean Huang
//
//  Created by seanhuang on 14-12-29.
//  Copyright (c) 2014年 seanhuang. All rights reserved.
//

#import <objc/runtime.h>
#import "UIView+Superview.h"

#ifndef SHM_ImportMasonry_h
#define SHM_ImportMasonry_h

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

/**
 *
 */
#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7 && [[[UIDevice currentDevice] systemVersion] doubleValue] < 8)

static NSDictionary *uiview_dict = nil;

@implementation UIView (Superview)

- (UIView *)findSuperviewWithClass:(Class)superviewClass {
    UIView *superview = self.superview;
    UIView *foundSuperview = nil;
    
    while (nil != superview && nil == foundSuperview) {
        if ([superview isKindOfClass:superviewClass]) {
            foundSuperview = superview;
        } else {
            superview = superview.superview;
        }
    }
    return foundSuperview;
}

- (void)setDict:(NSDictionary *)dict_ {
    objc_setAssociatedObject(self, (__bridge const void *)(uiview_dict), dict_, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSDictionary *)dict {
    return objc_getAssociatedObject(self, (__bridge const void *)(uiview_dict));
}

#pragma mark -
- (void)addLineLeftWithColor:(UIColor *)borderColor
                       Width:(NSInteger)borderWidth {
    
    
    /**
     *
     */
    UIView *seperatorView = [[UIView alloc] init];
    seperatorView.backgroundColor = borderColor;
    
    [self addSubview:seperatorView];
    [seperatorView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(borderWidth);
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
}

- (void)addLineRightWithColor:(UIColor *)borderColor
                       Width:(NSInteger)borderWidth {
    
    
    /**
     *
     */
    UIView *seperatorView = [[UIView alloc] init];
    seperatorView.backgroundColor = borderColor;
    
    [self addSubview:seperatorView];
    [seperatorView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(borderWidth);
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
}

- (void)addLineBottomColor:(UIColor *)borderColor
                     Width:(NSInteger)borderWidth {

    /**
     *
     */
    if (IS_IOS7) {
        /**
         *
         */
        CALayer *border = [CALayer layer];
        border.borderColor = borderColor.CGColor;
        border.frame = CGRectMake(0,
                                  self.frame.size.height - borderWidth,
                                  self.frame.size.width,
                                  self.frame.size.height
//                                  borderWidth
                                  );
        border.borderWidth = borderWidth;
        [self.layer addSublayer:border];
        self.layer.masksToBounds = YES;
    } else {
        /**
         *
         */
        UIView *seperatorView = [[UIView alloc] init];
        seperatorView.backgroundColor = borderColor;
        
        [self addSubview:seperatorView];
        [seperatorView makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(borderWidth);
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
        }];
    }    
}
@end

