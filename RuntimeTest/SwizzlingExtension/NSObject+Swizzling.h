//
//  NSObject+Swizzling.h
//  RuntimeTest
//
//  Created by Liujinjun on 16/8/14.
//  Copyright © 2016年 NetEase Youdao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)

/**
 *  swizzling类方法
 *  @param clazz            类
 *  @param originalSelector 原方法
 *  @param swizzledSelector 新方法
 */
+ (void)swizzleClassMethodWithSelector:(SEL)originalSelector
                      swizzledSelector:(SEL)swizzledSelector;

/**
 *  swizzling实例方法
 *  @param clazz            类
 *  @param originalSelector 原方法
 *  @param swizzledSelector 新方法
 */
+ (void)swizzleInstanceMethodWithSelector:(SEL)originalSelector
                         swizzledSelector:(SEL)swizzledSelector;

@end
