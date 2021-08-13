//
//  YCLevelProgressView.m
//  YCLevelProgressView
//
//  Created by 安跃超 on 2019/3/13.
//  Copyright © 2019年 安跃超. All rights reserved.
//

#import "YCLevelProgressView.h"
#import "YCLevelProgressViewConfig.h"
#import <YCCategory/UIColor+YCCategory.h>


@interface YCLevelProgressView()
@property (nonatomic,strong)YCLevelProgressViewConfig *config;
@end

@implementation YCLevelProgressView


- (YCLevelProgressViewConfig *)config {
    if (!_config){
        _config = [YCLevelProgressViewConfig new];
        _config.getExp = 0;
        _config.totalExp = 350;
        _config.title = @"初学乍练";
        _config.level = 1;
        _config.trackTintColor = [UIColor yc_colorWithHex:@"#EAE5D0"];
        _config.progressTintColor = [UIColor yc_colorWithHex:@"#FCDB56"];
        _config.levelColor = [UIColor yc_colorWithHex:@"#9162E7"];
        _config.titleColor = [UIColor yc_colorWithHex:@"#9162E7"];
        _config.expColor = [UIColor yc_colorWithHex:@"#9162E7"];
    }
    return _config;
}

- (void)settingProgressWithConfig:(void (^)(YCLevelProgressViewConfig * _Nonnull))config {
    if (self.config){
        config(self.config);
    }
    [self setNeedsDisplay];
}

- (void)reachExpWithGetExp:(NSInteger)getExp totalExp:(NSInteger)totalExp title:(NSString *)title level:(NSInteger)level {
    self.config.getExp = getExp;
    self.config.totalExp = totalExp;
    self.config.title = title;
    self.config.level = level;
    [self setNeedsDisplay];
}

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]){
        [self setup];
    }
    return self;
}

- (void)setup{
    self.backgroundColor = [UIColor clearColor];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    if (_config == nil){
        [self config];
        return;
    }


    CGFloat origin = 10;
    CGFloat y = 10;
    CGFloat width = 200;
    CGFloat height = 20;

    NSInteger getExp = self.config.getExp;
    NSInteger totalExp = self.config.totalExp;

    //进度条
    CGPoint progressOrigin = CGPointMake(origin, y);
    CGPoint progressEnd = CGPointMake(origin + width, y);
    CGFloat lineThick = height;
    UIColor *lineColor = self.config.trackTintColor;
    [self drawProgressLineWithOrigin:progressOrigin end:progressEnd lineThick:lineThick color:lineColor];

    //获取经验进度条
    CGPoint pgOrigin = CGPointMake(origin, y);
    CGFloat pgWidth = getExp * width/totalExp;
    CGPoint pgEnd = CGPointMake(origin + pgWidth, y);
    CGFloat pgThick = height;
    UIColor *pgColor = self.config.progressTintColor;
    if (pgWidth != 0){
        [self drawProgressLineWithOrigin:pgOrigin end:pgEnd lineThick:pgThick color:pgColor];
    }

    //等级图片
    CGFloat levelOrigin = origin;
    CGFloat levelY = y - lineThick/2 + 3;
    CGFloat levelHeight = 15;
    CGFloat levelWidth = 15;
    CGRect levelRect = CGRectMake(levelOrigin, levelY, levelWidth, levelHeight);
    NSString *levelStr = [NSString stringWithFormat:@"%ld",self.config.level];
    UIImage *levelImage = [UIImage imageNamed:@"mine_header_pu"];
    UIFont *levelFont = [UIFont systemFontOfSize:8];
    UIColor *levelColor = self.config.levelColor;
    [self drawLevelImageWithRect:levelRect LevelStr:levelStr image:levelImage levelColor:levelColor levelFont:levelFont];

    //称号
    CGFloat titleOrigin = origin + 20;
    CGFloat titleY = y - lineThick/2 + 3;
    CGFloat titleWidth = 80;
    CGFloat titleHeight = height;
    CGRect titleRect = CGRectMake(titleOrigin, titleY, titleWidth, titleHeight);
    NSString *title = self.config.title;
    UIFont *titleFont = [UIFont boldSystemFontOfSize:12];
    UIColor *titleColor = self.config.titleColor;
    [self drawTextWithString:title rect:titleRect textColor:titleColor textFont:titleFont textAlignment:NSTextAlignmentLeft];

    //经验值
    CGFloat expOrigin = origin + 120;
    CGFloat expY = y - lineThick/2 + 4;;
    CGFloat expWidth = 80;
    CGFloat expHeight = height;
    CGRect expRect = CGRectMake(expOrigin, expY, expWidth, expHeight);
    NSString *expStr = [NSString stringWithFormat:@"%ld/%ld",getExp,totalExp];
    UIColor *expColor = self.config.expColor;
    UIFont *expFont = [UIFont boldSystemFontOfSize:10];
    [self drawTextWithString:expStr rect:expRect textColor:expColor textFont:expFont textAlignment:NSTextAlignmentRight];

    [super drawRect:rect];
}

//画进度条
- (void)drawProgressLineWithOrigin:(CGPoint)origin
                               end:(CGPoint)end
                         lineThick:(CGFloat)lineThick
                             color:(UIColor *)color{

    CGContextRef contentRef = UIGraphicsGetCurrentContext();
    //开启或关闭位图Graphics Context的反锯齿效果
    CGContextSetShouldAntialias(contentRef, YES);
    //控制一个特定Graphics Context是否支持反锯齿 false表示不支持
    CGContextSetAllowsAntialiasing(contentRef, YES);
    CGContextMoveToPoint(contentRef, origin.x, origin.y);
    CGContextAddLineToPoint(contentRef, end.x, end.y);

    CGContextSetLineWidth(contentRef, lineThick);
    CGContextSetLineCap(contentRef, kCGLineCapRound);
    CGContextSetLineJoin(contentRef, kCGLineJoinRound);
    [color set];
    CGContextClosePath(contentRef);
    CGContextStrokePath(contentRef);
}

//画文字
- (void)drawTextWithString:(NSString *)string
                      rect:(CGRect)rect
                 textColor:(UIColor *)textColor
                  textFont:(UIFont *)textFont
             textAlignment:(NSTextAlignment)textAlignment{

    NSString *dstring = [string copy];
    CGContextRef contentRef = UIGraphicsGetCurrentContext();
    //        开启或关闭位图Graphics Context的反锯齿效果
    CGContextSetShouldAntialias(contentRef, YES);
    //        控制一个特定Graphics Context是否支持反锯齿 false表示不支持
    CGContextSetAllowsAntialiasing(contentRef, YES);



    NSMutableParagraphStyle* paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment=textAlignment;//文字

    [dstring drawInRect:rect withAttributes:@{
                                              NSFontAttributeName:textFont,
                                              NSForegroundColorAttributeName:textColor,
                                              NSParagraphStyleAttributeName: paragraphStyle,    NSStrikethroughStyleAttributeName : @(NSUnderlineStyleNone),
                                              }];
    CGContextDrawPath(contentRef, kCGPathStroke);
}

//画等级+图片
- (void)drawLevelImageWithRect:(CGRect)rect
                      LevelStr:(NSString *)levelStr
                         image:(UIImage *)image
                    levelColor:(UIColor *)levelColor
                     levelFont:(UIFont *)levelFont{
    [image drawInRect:rect];
    CGRect titleR = CGRectMake(rect.origin.x, rect.origin.y + 2, 14, 14);
    [self drawTextWithString:levelStr rect:titleR textColor:levelColor textFont:levelFont textAlignment:NSTextAlignmentCenter];
}


@end
