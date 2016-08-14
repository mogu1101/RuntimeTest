//
//  UIViewController+Tracking.m
//  RuntimeTest
//
//  Created by Liujinjun on 16/8/14.
//  Copyright © 2016年 NetEase Youdao. All rights reserved.
//

#import "UIViewController+Tracking.h"
#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation UIViewController (Tracking)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzlingSelector:@selector(viewWillAppear:) withSwizzledSelector:@selector(jj_viewWillAppear:)];
    });
}

#pragma mark - Method Swizzling
- (void)jj_viewWillAppear:(BOOL)animation {
    [self jj_viewWillAppear:YES];
    NSLog(@"viewWillAppear: %@", self);
}

@end
