//
//  YCLevelProgressViewConfig.h
//  YCLevelProgressView
//
//  Created by 安跃超 on 2019/3/13.
//  Copyright © 2019年 安跃超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCLevelProgressViewConfig : NSObject
//获得的经验 默认 0
@property (nonatomic,assign)NSInteger getExp;
//最大经验 默认 350
@property (nonatomic,assign)NSInteger totalExp;
//称号 默认 初学乍练
@property (nonatomic,strong)NSString *title;
//等级 默认 1
@property (nonatomic,assign)NSInteger level;
//背景颜色 默认 EAE5D0
@property (nonatomic,strong)UIColor *trackTintColor;
//进度颜色 默认 FCDB56
@property (nonatomic,strong)UIColor *progressTintColor;
//等级字体颜色 默认 9162E7
@property (nonatomic,strong)UIColor *levelColor;
//称号颜色 默认 9162E7
@property (nonatomic,strong)UIColor *titleColor;
//经验值颜色 默认 9162E7
@property (nonatomic,strong)UIColor *expColor;

@property (nonatomic,strong,readonly)YCLevelProgressViewConfig *(^setGetExp)(NSInteger getExp);
@property (nonatomic,strong,readonly)YCLevelProgressViewConfig *(^setTotalExp)(NSInteger totalExp);
@property (nonatomic,strong,readonly)YCLevelProgressViewConfig *(^setTitle)(NSString *title);
@property (nonatomic,strong,readonly)YCLevelProgressViewConfig *(^setLevel)(NSInteger level);
@property (nonatomic,strong,readonly)YCLevelProgressViewConfig *(^setTrackTintColor)(UIColor *trackTintColor);
@property (nonatomic,strong,readonly)YCLevelProgressViewConfig *(^setProgressTintColor)(UIColor *progressTintColor);
@property (nonatomic,strong,readonly)YCLevelProgressViewConfig *(^setLevelColor)(UIColor *levelColor);
@property (nonatomic,strong,readonly)YCLevelProgressViewConfig *(^setTitleColor)(UIColor *titleColor);
@property (nonatomic,strong,readonly)YCLevelProgressViewConfig *(^setExpColor)(UIColor *expColor);
@end

