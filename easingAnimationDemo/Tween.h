//
//  Tween.h
//  layerTest
//
//  Created by 谢斌 on 15/11/26.
//  Copyright © 2015年 谢斌. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^TweenFunction)(double s);

/// Tween
/// 根据对应的fromeValue和toValue类型返回
/// 相应的差值计算函数
TweenFunction Tween(id fromValue, id toValue);
