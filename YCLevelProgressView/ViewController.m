//
//  ViewController.m
//  YCLevelProgressView
//
//  Created by 安跃超 on 2019/3/13.
//  Copyright © 2019年 安跃超. All rights reserved.
//

#import "ViewController.h"
#import "YCLevelProgressView.h"
#import "YCConfig.h"

@interface ViewController ()
{
//    NSInteger _i;
    NSInteger _currentExp;
    NSInteger _totalsExp;
    NSString *_titleName;
    NSInteger _level;
    NSInteger _day;
}
@property (nonatomic,strong)YCLevelProgressView *progressView;
@property (nonatomic,strong)UIButton *startBtn;
@property (nonatomic,strong)YCLevelModel *levelModel;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    _i = 0;
    _currentExp = 0;
    _totalsExp = 349;
    _titleName = @"初学乍练";
    _level = 1;
    _day = 1;



    YCLevelModel *levelModel = [YCConfig getLevelModel];
    _levelModel = levelModel;

    [self.view addSubview:self.startBtn];
    [self.view addSubview:self.progressView];
}

- (void)startAction:(UIButton *)sender {

//    for (YCLevelDataModel *data in self.levelModel.levelList) {
//
//        NSLog(@"当前 等级：%ld，称谓：%@，升级天数：%ld，经验：%ld \n",data.level,data.title,data.day,data.exp);
//    }
//    _i = 0;
    self.timer.fireDate = [NSDate date];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)update:(NSTimer *)ti {
    _currentExp += 100;
    NSInteger _i = 0;
    @synchronized (self) {
        for (YCLevelDataModel *data in self.levelModel.levelList) {
            if (self.levelModel.levelList.count <= _i) {
                _timer.fireDate = [NSDate distantFuture];
                _timer = nil;
                _currentExp = _totalsExp;
                _i = 0;
                return;
            }
            if (data.exp-1 == _totalsExp && data.exp-1 <= _currentExp) {
                if (self.levelModel.levelList.count > _i + 1) {
                    _totalsExp = self.levelModel.levelList[_i + 1].exp - 1;
                    _titleName = self.levelModel.levelList[_i + 1].title;
                    _level = self.levelModel.levelList[_i + 1].level;
                    _day = self.levelModel.levelList[_i + 1].day;
                }
            } else {
                if (data.exp == 0) {
                    _totalsExp = self.levelModel.levelList[_i + 1].exp - 1;
                    _titleName = self.levelModel.levelList[_i + 1].title;
                    _level = self.levelModel.levelList[_i + 1].level;
                    _day = self.levelModel.levelList[_i + 1].day;
                }
            }
            _i ++;
        }
    }

    NSLog(@"当前 等级：%ld 当前经验：%ld，称谓：%@，升级天数：%ld，经验：%ld \n",_level,_currentExp,_titleName,_day,_totalsExp);
    [self.progressView reachExpWithGetExp:_currentExp totalExp:_totalsExp title:_titleName level:_level];
}

- (UIButton *)startBtn {
        if (!_startBtn) {
            UIButton *startBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 100, 30)] ;
            [startBtn setTitle:@"开始升级" forState:UIControlStateNormal];
            [startBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            startBtn.backgroundColor = [UIColor redColor];
            startBtn.titleLabel.font = [UIFont systemFontOfSize:20];
            startBtn.titleLabel.textAlignment =  NSTextAlignmentCenter;
            [startBtn addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
            _startBtn = startBtn;
        }
        return _startBtn;
}

- (YCLevelProgressView *)progressView {
    if (!_progressView){
        _progressView = [[YCLevelProgressView alloc] initWithFrame:CGRectMake(50, 100, 250, 30)];
        [_progressView settingProgressWithConfig:^(YCLevelProgressViewConfig * _Nonnull config) {
            config.getExp = 0;
            config.totalExp = 349;
            config.title = @"初学乍练";
            config.level = 1;
        }];
    }
    return _progressView;
}

- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(update:) userInfo:nil repeats:YES];
    }
    return _timer;
}

@end
