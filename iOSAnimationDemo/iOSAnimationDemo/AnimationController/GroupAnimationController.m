//
//  GroupAnimationController.m
//  iOSAnimationDemo
//
//  Created by Hugin on 2018/12/13.
//  Copyright © 2018 Hugin. All rights reserved.
//

#import "GroupAnimationController.h"

@interface GroupAnimationController ()
@property (nonatomic, strong) UIView *demoView;
@end

@implementation GroupAnimationController

- (UIView *)demoView {
    if (!_demoView) {
        _demoView = ({
            UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 50, SCREEN_HEIGHT/2 - 50, 100 ,100)];
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
    return @[@"同时",@"连续"];
}
- (NSString *)controllerTitle {
    return @"组动画";
}
- (void)clickBtn:(UIButton *)btn{
    switch(btn.tag) {
        case 0:
            [self groupAnimation1];
            break;
        case 1:
            [self groupAnimation2];
            break;
    }
}

// 同时执行一组动画
- (void)groupAnimation1 {
    // 位移动画
    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3 , SCREEN_HEIGHT/2)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2+100)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2+100)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2)];
    anima1.values = @[value0,value1,value2,value3,value4,value5];
    // anima1.duration = 1.0f;
    
    // 缩放动画
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue = [NSNumber numberWithFloat:0.5f];
    anima2.toValue = [NSNumber numberWithFloat:2.0f];
    // anima2.duration = 1.0f;
    
    // 旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue = [NSNumber numberWithFloat:M_PI * 4];
    // anima3.duration = 1.0f;
    
    // 组动画
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[anima1, anima2, anima3];
    groupAnimation.duration = 3.0f; // 这个是总时间，如果添加的动画有时间的话，会按最短时间算
    
    // [self.demoView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
    
    // ---------------------------------------------------------------------- //
    
    // 依次添加三个 anima 到 layer，也有组动画的效果
    // 这里的时间要按照总时间，不然会按时间最短者算
    anima1.duration = 3.0f;
    anima2.duration = 3.0f;
    anima3.duration = 3.0f;
    // 这里的 animation key name 不能相同，相同则会覆盖
    [self.demoView.layer addAnimation:anima1 forKey:@"animation1"];
    [self.demoView.layer addAnimation:anima2 forKey:@"animation2"];
    [self.demoView.layer addAnimation:anima3 forKey:@"animation3"];
    
}

// 按顺序执行的组动画
- (void)groupAnimation2 {
    // 拿到当前系统执行时的真实时间
    CFTimeInterval currentTime = CACurrentMediaTime();
    
    // 位移动画
    CABasicAnimation *anima1 = [CABasicAnimation animationWithKeyPath:@"position"];
    anima1.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    anima1.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/2 - 50, SCREEN_HEIGHT/2 - 50)];
    anima1.beginTime = currentTime;
    anima1.duration = 1.0f; // 按顺序执行则是按当前动画的时间
    anima1.fillMode = kCAFillModeForwards; // 这里要保持动画执行后的状态
    anima1.removedOnCompletion = NO;
    [_demoView.layer addAnimation:anima1 forKey:@"positionAnimt"];
    
    // 位移动画
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue = @(0.5f);
    anima2.toValue = @(2.0f);
    anima2.beginTime = currentTime + 1.0f; // 开始时间加上之前动画的执行时间
    anima2.duration = 1.0f; // 按顺序执行则是按当前动画的时间
    anima2.fillMode = kCAFillModeForwards;
    anima2.removedOnCompletion = NO;
    [_demoView.layer addAnimation:anima2 forKey:@"scaleAnimt"];
    
    // 旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.fromValue = @(0.f);
    anima3.toValue = @(M_PI * 4);
    anima3.beginTime = currentTime + 2.0f; // 开始时间加上之前动画的执行时间
    anima3.duration = 1.0f; // 按顺序执行则是按当前动画的时间
    anima3.fillMode = kCAFillModeForwards;
    anima3.removedOnCompletion = NO;
    [_demoView.layer addAnimation:anima3 forKey:@"rotationAnimt"];
    
    
}

@end
