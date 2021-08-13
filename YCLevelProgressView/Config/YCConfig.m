//
//  YCConfig.m
//  YCLevelProgressView
//
//  Created by 安跃超 on 2019/3/13.
//  Copyright © 2019年 安跃超. All rights reserved.
//

#import "YCConfig.h"
#import "YCLevelModel.h"
#import <YYModel.h>

@interface YCConfig()
@property (nonatomic,strong,class)YCLevelModel *levelModel;
@end

@implementation YCConfig

static YCLevelModel *_levelModel;

+ (void)setYCLevelModel:(YCLevelModel *)yclevelModel {
    _levelModel = yclevelModel;
}

+ (YCLevelModel *)getLevelModel {
    return _levelModel;
}

+ (void)load{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"LevelList.plist" ofType:nil];
   NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    _levelModel = [YCLevelModel yy_modelWithJSON:data];

}
@end
