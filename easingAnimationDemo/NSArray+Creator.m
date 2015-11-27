//
//  NSArray+Creator.m
//  layerTest
//
//  Created by 谢斌 on 15/11/25.
//  Copyright © 2015年 谢斌. All rights reserved.
//

#import "NSArray+Creator.h"

@implementation NSArray (Creator)

+ (NSArray *)arrayWithCount:(NSUInteger)count block:(id (^)(NSUInteger))block
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger i = 0; i < count; ++i) {
        [array addObject:block(i)];
    }
    return [NSArray arrayWithArray:array];
}

@end