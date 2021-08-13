//
//  YCLevelModel.m
//  YCLevelProgressView
//
//  Created by 安跃超 on 2019/3/13.
//  Copyright © 2019年 安跃超. All rights reserved.
//

#import "YCLevelModel.h"

@implementation YCLevelDataModel

@end

@implementation YCLevelModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"levelList" : [YCLevelDataModel.class mutableCopy]};
}

@end
