//
//  YCLevelModel.h
//  YCLevelProgressView
//
//  Created by 安跃超 on 2019/3/13.
//  Copyright © 2019年 安跃超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@interface YCLevelDataModel : NSObject<YYModel>
@property (nonatomic,assign)NSInteger level;
@property (nonatomic,strong)NSString *title;
@property (nonatomic,assign)NSInteger day;
@property (nonatomic,assign)NSInteger exp;
@end

@interface YCLevelModel : NSObject<YYModel>

@property (nonatomic,strong)NSArray<YCLevelDataModel *> *levelList;

@end

@interface YCLevelCurrentModel : NSObject

@property (nonatomic,assign)NSInteger currentExp;
@property (nonatomic,assign)NSInteger totalsExp;
@property (nonatomic,strong)NSString *titleName;
@property (nonatomic,assign)NSInteger level;

@end

