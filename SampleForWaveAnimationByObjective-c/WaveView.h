//
//  WaveView.h
//  SampleForWaveAnimationByObjective-c
//
//  Created by satoutakeshi on 2015/07/08.
//  Copyright (c) 2015年 satoutakeshi. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface WaveView : UIView

@property (nonatomic) IBInspectable NSInteger circleLineWidth;
@property (nonatomic, strong) IBInspectable UIColor *circleLineColor;
@property (nonatomic, strong) IBInspectable UIColor *circleFillColor;
@property (nonatomic) IBInspectable CGFloat duration;
@property (nonatomic, strong) IBInspectable NSString *easingTypeStr;
@property (nonatomic, assign) IBInspectable BOOL autoStartFlg;



-(void)animationWaveStart;


@end
