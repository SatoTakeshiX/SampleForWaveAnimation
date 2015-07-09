//
//  ViewController.m
//  SampleForWaveAnimationByObjective-c
//
//  Created by satoutakeshi on 2015/07/08.
//  Copyright (c) 2015年 satoutakeshi. All rights reserved.
//

#import "ViewController.h"
#import "WaveView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet WaveView *waveView;
- (IBAction)stopAnimation:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)stopAnimation:(UIButton *)sender {
    
    //ボタンのオンオフでアニメーションを停止、再開させる
    //ボタンの選択状態を変更
    sender.selected = !sender.selected;
    

    if (sender.selected) {
        CFTimeInterval pausedTime = [self.waveView.layer convertTime:CACurrentMediaTime() fromLayer:nil];
        self.waveView.layer.speed = 0.0;
        self.waveView.layer.timeOffset = pausedTime;
        
    }else{
        CFTimeInterval pausedTime = [self.waveView.layer timeOffset];
        self.waveView.layer.speed = 1.0;
        self.waveView.layer.timeOffset = 0.0;
        CFTimeInterval timeSincePause = [self.waveView.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
        
        self.waveView.layer.beginTime = timeSincePause;
    }
}
@end
