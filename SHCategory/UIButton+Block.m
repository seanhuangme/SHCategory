//
//  UIButton+Block.m
//  Sean Huang
//
//  Created by seanhuang on 15-05-12.
//  Copyright (c) 2015年 seanhuang. All rights reserved.
//

#import "UIButton+Block.h"

@implementation UIButton (Block)

static char overviewKey;

- (void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)block {
    objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}


- (void)callActionBlock:(id)sender {
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(self, &overviewKey);
    if (block) {
        block();
    }
}

@end
