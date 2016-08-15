//
//  NSObject+Swizzling.m
//  RuntimeTest
//
//  Created by Liujinjun on 16/8/14.
//  Copyright © 2016年 NetEase Youdao. All rights reserved.
//

#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSObject (Swizzling)

+ (void)swizzleClassMethodWithSelector:(SEL)originalSelector
                      swizzledSelector:(SEL)swizzledSelector {
    
    Class clazz = object_getClass((id)self);
    Method originalMethod = class_getClassMethod(clazz, originalSelector);
    Method swizzledMethod = class_getClassMethod(clazz, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(clazz,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(clazz,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

+ (void)swizzleInstanceMethodWithSelector:(SEL)originalSelector
                         swizzledSelector:(SEL)swizzledSelector {
    
    Class clazz = [self class];
    Method originalMethod = class_getInstanceMethod(clazz, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(clazz, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(clazz,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(clazz,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
