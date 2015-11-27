//
//  NSArray+Creator.h
//  layerTest
//
//  Created by 谢斌 on 15/11/25.
//  Copyright © 2015年 谢斌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Creator)

+ (NSArray *)arrayWithCount:(NSUInteger)count block:(id(^)(NSUInteger index))block;

@end
