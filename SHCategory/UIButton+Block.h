//
//  UIButton+Block.h
//  QeeNiaoOC
//
//  Created by seanhuang on 15-05-12.
//  Copyright (c) 2015年 qeeniao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

typedef void (^ActionBlock)();

@interface UIButton (Block)

- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;

@end
