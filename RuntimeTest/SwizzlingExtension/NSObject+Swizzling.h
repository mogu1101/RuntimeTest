//
//  NSObject+Swizzling.h
//  RuntimeTest
//
//  Created by Liujinjun on 16/8/14.
//  Copyright © 2016年 NetEase Youdao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)

+ (void)swizzlingSelector:(SEL)originalSelector withSwizzledSelector:(SEL)swizzledSelector;

@end
