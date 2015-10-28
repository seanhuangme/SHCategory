//
//  UIViewController+AppDelegate.m
//  QeeNiaoOC
//
//  Created by seanhuang on 14-12-23.
//  Copyright (c) 2014年 qeeniao. All rights reserved.
//

#import "UIViewController+AppDelegate.h"
#import <objc/runtime.h>
#import "MobClick.h"
#import <HexColors/HexColor.h>
#import "ImportMasonry.h"
#import "Macro.h"

static UIView *uiviewcontroller_maskview = nil;
static UIView *uiviewcontroller_topbar = nil;

@implementation UIViewController (AppDelegate)
- (float)widthFactor {
    return floor([UIScreen mainScreen].bounds.size.width/320.00);
}

- (float)heightFactor {
    return floor([UIScreen mainScreen].bounds.size.height/480.00);
}

#pragma mark - Method Swizzling
+ (void)load {
    /**
     *
     */
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(xxx_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        // ...
        // Method originalMethod = class_getClassMethod(class, originalSelector);
        // Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
    
    static dispatch_once_t onceToken2;
    dispatch_once(&onceToken2, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillDisappear:);
        SEL swizzledSelector = @selector(xxx_viewWillDisappear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        // ...
        // Method originalMethod = class_getClassMethod(class, originalSelector);
        // Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)xxx_viewWillAppear:(BOOL)animated {
    [self xxx_viewWillAppear:animated];
    NSString *vcClassName = NSStringFromClass([self class]);
    NSLog(@"viewWillAppear: %@", vcClassName);

    /**
     *
     */
//    self.maskViewSean = [[UIView alloc] init];
//    self.maskViewSean.frame = [UIScreen mainScreen].bounds;
//    self.maskViewSean.backgroundColor = [UIColor colorWithHexString:@"000000"];
//    self.maskViewSean.alpha = 0.2;

    /**
     *
     */
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];

    /**
     *
     */
    [MobClick beginLogPageView:NSStringFromClass([self class])];
}

- (void)xxx_viewWillDisappear:(BOOL)animated {
    [self xxx_viewWillDisappear:animated];
    NSString *vcClassName = NSStringFromClass([self class]);
    LogBlue(@"viewWillDisappear: %@", vcClassName);
    
    /**
     *
     */
    [MobClick endLogPageView:NSStringFromClass([self class])];
}

#pragma mark - Associate
- (void)setMaskView:(UIView *)maskView_ {
    objc_setAssociatedObject(self, (__bridge const void *)(uiviewcontroller_maskview), maskView_, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)maskView {
    return objc_getAssociatedObject(self, (__bridge const void *)(uiviewcontroller_maskview));
}

- (void)setTopBar:(SeanTopBar *)topBar_ {
    objc_setAssociatedObject(self, (__bridge const void *)(uiviewcontroller_topbar), topBar_, OBJC_ASSOCIATION_RETAIN);
}

- (SeanTopBar *)topBar {
    return objc_getAssociatedObject(self, (__bridge const void *)(uiviewcontroller_topbar));
}

- (void)initTopBar {
    /**
     *
     */
    self.topBar = [[SeanTopBar alloc] init];
    
    [self.view addSubview:self.topBar];
    [self.topBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@64);
    }];
}
@end
