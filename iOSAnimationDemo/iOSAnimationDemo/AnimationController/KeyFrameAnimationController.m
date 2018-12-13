//
//  KeyFrameAnimationController.m
//  iOSAnimationDemo
//
//  Created by Hugin on 2018/12/13.
//  Copyright © 2018 Hugin. All rights reserved.
//

#import "KeyFrameAnimationController.h"

@interface KeyFrameAnimationController ()<CAAnimationDelegate>
@property (nonatomic, strong) UIView *demoView;
@end

@implementation KeyFrameAnimationController

- (UIView *)demoView {
    if (!_demoView) {
        _demoView = ({
            UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 25, SCREEN_HEIGHT/2 - 25, 50 ,50)];
            demoView.backgroundColor = [UIColor redColor];
            demoView;
        });
    }
    return _demoView;
}
- (void)initView {
    [super initView];
    [self.view addSubview:self.demoView];
}
- (NSArray *)operateTitleArray {
    return @[@"关键帧", @"路径", @"抖动"];
}
- (NSString *)controllerTitle {
    return @"关键帧动画";
}
-(void)clickBtn:(UIButton *)btn {
    switch (btn.tag) {
        case 0:
            [self keyFrameAnimation];
            break;
        case 1:
            [self pathAnimation];
            break;
        case 2:
            [self shakeAnimation];
            break;
    }
}
- (void)keyFrameAnimation { // 关键帧
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = @(CGPointMake(25, SCREEN_HEIGHT/2));
    NSValue *value1 = @(CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2));
    NSValue *value2 = @(CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2+50));
    NSValue *value3 = @(CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2+50));
    NSValue *value4 = @(CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2));
    NSValue *value5 = @(CGPointMake(SCREEN_WIDTH-25, SCREEN_HEIGHT/2));
    anima.values = @[value0, value1, value2, value3, value4, value5];
    anima.duration = 2.0f;
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//设置动画的节奏
    anima.delegate = self; // 设置代理，可以检测动画的开始和结束
    [_demoView.layer addAnimation:anima forKey:@"keyFrameAnimation"];
}
-(void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"开始动画");
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"结束动画");
}

- (void)pathAnimation {  // 路径
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2-100, 200, 200)];
    anima.path = path.CGPath;
    [_demoView.layer addAnimation:anima forKey:@"pathAnimation"];
}
- (void)shakeAnimation { // 抖动
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    NSValue *v1 = @(-M_PI_4 / 90 * 15);
    NSValue *v2 = @(M_PI_4 / 90 * 15);
    NSValue *v3 = @(-M_PI_4 / 90 * 15);
    anima.values = @[v1, v2, v3];
    anima.repeatCount = MAXFLOAT;
    [_demoView.layer addAnimation:anima forKey:@"shakeAnimation"];
}

@end
