//
//  YCLevelProgressView.h
//  YCLevelProgressView
//
//  Created by 安跃超 on 2019/3/13.
//  Copyright © 2019年 安跃超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCLevelProgressViewConfig.h"

@interface YCLevelProgressView : UIView
//加载配置
- (void)settingProgressWithConfig:(void (^)(YCLevelProgressViewConfig *))config;
//获得经验
- (void)reachExpWithGetExp:(NSInteger)getExp totalExp:(NSInteger)totalExp title:(NSString *)title level:(NSInteger)level;
@end

