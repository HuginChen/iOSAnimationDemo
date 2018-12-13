//
//  TransitionAnimationController.m
//  iOSAnimationDemo
//
//  Created by Hugin on 2018/12/13.
//  Copyright © 2018 Hugin. All rights reserved.
//

#import "TransitionAnimationController.h"

@interface TransitionAnimationController ()
@property (nonatomic, strong) UIView *demoView;
@property (nonatomic, strong) UILabel *demoLabel;
@property (nonatomic, assign) NSInteger index;
@end

@implementation TransitionAnimationController

- (UIView *)demoView {
    if (!_demoView) {
        _demoView = ({
            UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/4, SCREEN_HEIGHT/4, SCREEN_WIDTH/2, SCREEN_HEIGHT/2)];
            demoView;
        });
    }
    return _demoView;
}

- (void)initView {
    [super initView];
    [self.view addSubview:self.demoView];
    
    _demoLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(_demoView.frame)/2-10, CGRectGetHeight(_demoView.frame)/2-20, 20, 40)];
    _demoLabel.textAlignment = NSTextAlignmentCenter;
    _demoLabel.font = [UIFont systemFontOfSize:40];
    [self.demoView addSubview:_demoLabel];
    
    [self changeView:YES];
}

// 设置view的值
- (void)changeView:(BOOL)isUp {
    if (_index>3) {
        _index = 0;
    }
    if (_index<0) {
        _index = 3;
    }
    NSArray *colors = @[[UIColor cyanColor], [UIColor magentaColor], [UIColor orangeColor], [UIColor purpleColor]];
    NSArray *titles = @[@"1", @"2", @"3", @"4"];
    _demoView.backgroundColor = [colors objectAtIndex:_index];
    _demoLabel.text = [titles objectAtIndex:_index];
    if (isUp) {
        _index++;
    }else{
        _index--;
    }
}

- (NSArray *)operateTitleArray {
    return @[@"fade", @"moveIn", @"push", @"reveal",
             @"cube", @"suck", @"oglFlip", @"ripple",
             @"Curl", @"UnCurl", @"caOpen", @"caClose"];
}
- (NSString *)controllerTitle {
    return @"过渡动画";
}
- (void)clickBtn:(UIButton *)btn {
    [self changeView:YES];
    switch(btn.tag) {
        case 0:
            [self fadeAnimation];
            break;
        case 1:
            [self moveInAnimation];
            break;
        case 2:
            [self pushAnimation];
            break;
        case 3:
            [self revealAnimation];
            break;
        case 4:
            [self cubeAnimation];
            break;
        case 5:
            [self suckEffectAnimation];
            break;
        case 6:
            [self oglFlipAnimation];
            break;
        case 7:
            [self rippleEffectAnimation];
            break;
        case 8:
            [self pageCurlAnimation];
            break;
        case 9:
            [self pageUnCurlAnimation];
            break;
        case 10:
            [self cameraIrisHollowOpenAnimation];
            break;
        case 11:
            [self cameraIrisHollowCloseAnimation];
            break;
    }
}

/*
 Common transition types.
 kCATransitionFade;
 kCATransitionMoveIn
 kCATransitionPush
 kCATransitionReveal
 
 Common transition subtypes.
 kCATransitionFromRight
 kCATransitionFromLeft
 kCATransitionFromTop
 kCATransitionFromBottom
 */

- (void)fadeAnimation { // 逐渐消失
    // 因为 backgroundColor and text 都在变化，所以过渡动画指的是变化的过程动画
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionFade;         // 类型
    anima.subtype = kCATransitionFromRight; // 方向
    anima.startProgress = 0.01f;            // 起点
    anima.endProgress = 0.99f;              // 终点
    anima.duration = 0.75f;                 // 时间
    [_demoView.layer addAnimation:anima forKey:@"fadeAnimation"];
}
- (void)moveInAnimation { // 逐渐进入
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionMoveIn;       // 类型
    anima.subtype = kCATransitionFromLeft;  // 方向
    [_demoView.layer addAnimation:anima forKey:@"moveInAnimation"];
}
- (void)pushAnimation { // 逐渐挤出
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionPush;         // 类型
    anima.subtype = kCATransitionFromTop;   // 方向
    [_demoView.layer addAnimation:anima forKey:@"pushAnimation"];
}
- (void)revealAnimation { // 逐渐抽出
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionReveal;       // 类型
    anima.subtype = kCATransitionFromBottom;// 方向
    [_demoView.layer addAnimation:anima forKey:@"revealAnimation"];
}

/*
 以下使用的都是 private api
 如果 apple 因为 app 包含 private api 拒绝你 app，
 和在 ios 系统更新后 app 异常，都是正常操作，不要方。
 */
- (void)cubeAnimation {         // 立体翻转
    CATransition *anima = [CATransition animation];
    anima.type = @"cube";
    [_demoView.layer addAnimation:anima forKey:@"cubeAnimation"];
}
- (void)suckEffectAnimation {   // 抽纸效果
    CATransition *anima = [CATransition animation];
    anima.type = @"suckEffect";
    [_demoView.layer addAnimation:anima forKey:@"suckEffectAnimation"];
}
- (void)oglFlipAnimation {      // 纸片翻转
    CATransition *anima = [CATransition animation];
    anima.type = @"oglFlip";
    [_demoView.layer addAnimation:anima forKey:@"oglFlipAnimation"];
}
- (void)rippleEffectAnimation { // 波纹效果
    CATransition *anima = [CATransition animation];
    anima.type = @"rippleEffect";
    [_demoView.layer addAnimation:anima forKey:@"rippleEffectAnimation"];
}
- (void)pageCurlAnimation {     // 翻页效果
    CATransition *anima = [CATransition animation];
    anima.type = @"pageCurl";
    [_demoView.layer addAnimation:anima forKey:@"pageCurlAnimation"];
}
- (void)pageUnCurlAnimation {   // 反向翻页
    CATransition *anima = [CATransition animation];
    anima.type = @"pageUnCurl";
    [_demoView.layer addAnimation:anima forKey:@"pageUnCurlAnimation"];
}
- (void)cameraIrisHollowOpenAnimation { // 相机开镜
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"cameraIrisHollowOpen";
    [_demoView.layer addAnimation:anima forKey:@"cameraIrisHollowOpenAnimation"];
}
- (void)cameraIrisHollowCloseAnimation { // 相机关镜
    CATransition *anima = [CATransition animation];
    anima.type = @"cameraIrisHollowClose";
    [_demoView.layer addAnimation:anima forKey:@"cameraIrisHollowCloseAnimation"];
}


@end
