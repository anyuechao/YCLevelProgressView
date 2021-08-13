//
//  YCLevelProgressViewConfig.m
//  YCLevelProgressView
//
//  Created by 安跃超 on 2019/3/13.
//  Copyright © 2019年 安跃超. All rights reserved.
//

#import "YCLevelProgressViewConfig.h"

@implementation YCLevelProgressViewConfig

- (YCLevelProgressViewConfig *(^)(NSInteger))setGetExp {
    return ^(NSInteger getExp){
        self.getExp = getExp;
        return self;
    };
}


- (YCLevelProgressViewConfig *(^)(NSInteger))setTotalExp {
    return ^(NSInteger totalExp) {
        self.totalExp = totalExp;
        return self;
    };
}

- (YCLevelProgressViewConfig *(^)(NSString *))setTitle {
    return ^(NSString *title){
        self.title = title;
        return self;
    };
}

- (YCLevelProgressViewConfig *(^)(NSInteger))setLevel {
    return ^(NSInteger level){
        self.level = level;
        return self;
    };
}

- (YCLevelProgressViewConfig *(^)(UIColor *))setTrackTintColor {
    return ^(UIColor *trackTintColor) {
        self.trackTintColor = trackTintColor;
        return self;
    };
}

- (YCLevelProgressViewConfig *(^)(UIColor *))setProgressTintColor {
    return ^(UIColor *progressTintColor) {
        self.progressTintColor = progressTintColor;
        return self;
    };
}

- (YCLevelProgressViewConfig *(^)(UIColor *))setLevelColor {
    return ^(UIColor *levelColor){
        self.levelColor = levelColor;
        return self;
    };
}

- (YCLevelProgressViewConfig *(^)(UIColor *))setTitleColor {
    return ^(UIColor *titleColor) {
        self.titleColor = titleColor;
        return self;
    };
}

- (YCLevelProgressViewConfig *(^)(UIColor *))setExpColor {
    return ^(UIColor *expColor){
        self.expColor = expColor;
        return self;
    };
}

@end
