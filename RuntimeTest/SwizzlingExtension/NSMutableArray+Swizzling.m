//
//  NSMutableArray+Swizzling.m
//  RuntimeTest
//
//  Created by Liujinjun on 16/8/15.
//  Copyright © 2016年 NetEase Youdao. All rights reserved.
//

#import "NSMutableArray+Swizzling.h"
#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSMutableArray (Swizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSPlaceholderArray") swizzleInstanceMethodWithSelector:@selector(initWithObjects:count:) swizzledSelector:@selector(jj_initWithObjects:count:)];
        [objc_getClass("__NSArrayM") swizzleInstanceMethodWithSelector:@selector(addObject:) swizzledSelector:@selector(jj_addObject:)];
        [objc_getClass("__NSArrayM") swizzleInstanceMethodWithSelector:@selector(removeObject:) swizzledSelector:@selector(jj_removeObject:)];
        [objc_getClass("__NSArrayM") swizzleInstanceMethodWithSelector:@selector(removeObjectAtIndex:) swizzledSelector:@selector(jj_removeObjectAtIndex:)];
        [objc_getClass("__NSArrayM") swizzleInstanceMethodWithSelector:@selector(insertObject:atIndex:) swizzledSelector:@selector(jj_insertObject:atIndex:)];
        [objc_getClass("__NSArrayM") swizzleInstanceMethodWithSelector:@selector(objectAtIndex:) swizzledSelector:@selector(jj_objectAtIndex:)];
    });
}

- (instancetype)jj_initWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {
    id __unsafe_unretained newObjects[cnt];
    NSInteger index = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        if ([objects[i] isKindOfClass:[NSArray class]]) {
            NSLog(@"%@", objects[i]);
        }
        if (objects[i] == nil) {
            NSLog(@"%s objects at index %lu is nil, it will be filtered!", __FUNCTION__, i);
        } else {
            newObjects[index++] = objects[i];
        }
    }
    return [self jj_initWithObjects:newObjects count:index];
}

- (void)jj_addObject:(id)anObject {
    if (anObject == nil) {
        NSLog(@"%s can not add a nil object into array", __FUNCTION__);
        return;
    }
    [self jj_addObject:anObject];
}

- (void)jj_removeObject:(id)anObject {
    if (anObject == nil) {
        NSLog(@"%s call -removeObject:, but argument obj is nil", __FUNCTION__);
        return;
    }
    [self jj_removeObject:anObject];
}

- (void)jj_removeObjectAtIndex:(NSUInteger)index {
    if (self.count <= 0) {
        NSLog(@"%s can not remove an object from an empty array", __FUNCTION__);
        return;
    }
    if (index >= self.count) {
        NSLog(@"%s index %lu out of bound, array count is %lu", __FUNCTION__, index, self.count);
        return;
    }
    [self jj_removeObjectAtIndex:index];
}

- (void)jj_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject == nil) {
        NSLog(@"%s can not insert a nil object into array", __FUNCTION__);
        return;
    }
    if (index > self.count) {
        NSLog(@"%s index %lu out of bound, array count is %lu", __FUNCTION__, index, self.count);
        return;
    }
    [self jj_insertObject:anObject atIndex:index];
}

- (id)jj_objectAtIndex:(NSUInteger)index {
    if (self.count <= 0) {
        NSLog(@"%s can not get an object from an empty array", __FUNCTION__);
        return nil;
    }
    if (index >= self.count) {
        NSLog(@"%s index %lu out of bound, array count is %lu", __FUNCTION__, index, self.count);
        return nil;
    }
    return [self jj_objectAtIndex:index];
}

@end
