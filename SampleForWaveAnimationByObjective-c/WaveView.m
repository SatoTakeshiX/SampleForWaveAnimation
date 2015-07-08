//
//  WaveView.m
//  SampleForWaveAnimationByObjective-c
//
//  Created by satoutakeshi on 2015/07/08.
//  Copyright (c) 2015年 satoutakeshi. All rights reserved.
//

#import "WaveView.h"

@implementation WaveView


- (void)drawRect:(CGRect)rect {
    
    // コンテキストを取得
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //矩形を設定
    CGRect insetBound = self.bounds;
    //線の太さによって矩形を縮小
    insetBound = CGRectInset(insetBound, _circleLineWidth, _circleLineWidth);
    CGColorRef strokeColor = [_circleLineColor CGColor];
    //円周線の色を設定
    CGContextSetStrokeColorWithColor(context, strokeColor);
    //円周線の太さを設定
    CGContextSetLineWidth(context, _circleLineWidth);
    //円周線描画
    CGContextStrokeEllipseInRect(context, insetBound);
    
    //塗りつぶし色の設定
    CGColorRef fillColor = [_circleFillColor CGColor];
    CGContextSetFillColorWithColor(context, fillColor);
    //塗りつぶし色の設定
    CGContextFillEllipseInRect(context, insetBound);
    
    
}

-(void)awakeFromNib
{
    if (self.autoStartFlg) {
        [self animationWaveStart];
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    
}

-(void)animationWaveStart;
{
    
    //拡大アニメーション設定
    CABasicAnimation *scaleOut = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleOut.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.5, 1.5, 1)];
    
    // フェードアニメーション設定
    CABasicAnimation* fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeIn.fromValue = @1;
    fadeIn.toValue   = @0.2;
    
    //グループ設定で並列アニメーション
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[scaleOut,fadeIn];
    
    //イージング設定
    if ([self.easingTypeStr  isEqualToString: @"Linear"]) {
        group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    }else if([self.easingTypeStr isEqualToString:@"EaseIn"])
    {
        group.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    }else if([self.easingTypeStr isEqualToString:@"EaseOut"])
    {
        group.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    }else if([self.easingTypeStr isEqualToString:@"EaseInEaseOut"])
    {
        group.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    }else{
        
    }
    
    
    //アニメーション終わったらアニメーションオブジェクトを削除する
    group.removedOnCompletion = YES;
    group.fillMode = kCAFillModeForwards;
    group.duration = self.duration;
    //永遠に繰り返す（HUGE_VALで延々繰り返し設定）
    group.repeatCount = HUGE_VAL;
    //反転をする
    group.autoreverses = YES;

    //レイヤーにアニメーションを設定
    [self.layer addAnimation:group forKey:@"waveAnimation"];
    
}



@end
