//
//  BaseAnimationController.m
//  iOSAnimationDemo
//
//  Created by Hugin on 2018/12/12.
//  Copyright © 2018 Hugin. All rights reserved.
//

#import "BaseAnimationController.h"

@interface BaseAnimationController ()
@property (nonatomic, strong) UIView *demoView;
@end

@implementation BaseAnimationController
- (UIView *)demoView {
    if (!_demoView) {
        _demoView = ({
            UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 50, SCREEN_HEIGHT/2 - 50, 100 ,100)];
            demoView.backgroundColor = [UIColor redColor];
            demoView.userInteractionEnabled = YES;
            demoView;
        });
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
        [_demoView addGestureRecognizer:tap];
    }
    return _demoView;
}
- (void)click {
    NSLog(@"233");
}

- (void)initView {
    [super initView];
    [self.view addSubview:self.demoView];
}


- (NSArray *)operateTitleArray {
    return [NSArray arrayWithObjects:@"位移", @"透明度", @"缩放", @"旋转", @"背景色", nil];
}

- (NSString *)controllerTitle {
    return @"基础动画";
}

- (void)clickBtn:(UIButton *)btn {
    switch (btn.tag) {
        case 0:
            [self positionAnimation];
            break;
        case 1:
            [self opacityAniamtion];
            break;
        case 2:
            [self scaleAnimation];
            break;
        case 3:
            [self rotateAnimation];
            break;
        case 4:
            [self backgroundAnimation];
            break;
    }
}
// 位移动画
- (void)positionAnimation {
    // 使用 CABasicAnimation 创建基础动画
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT / 2)];
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT / 2)];
    anima.duration = 1.0f;
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    // 设置这两属性后，那么在动画执行完毕后，图层会保持显示动画执行后的状态。
    // 但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
    // 此时假设有交互事件，那么此时接收交互事件的区域还是在原来的区域
    // anima.removedOnCompletion = NO;
    // anima.fillMode = kCAFillModeForwards;
    
    [self.demoView.layer addAnimation:anima forKey:@"positionAnimation"];
    
    // ------------------------------------------------------ //
    
    // 使用 UIView blcok 创建动画
//    self.demoView.frame = CGRectMake(0, SCREEN_HEIGHT / 2 - 50, 100, 100);
//    [UIView animateWithDuration:0.75 animations:^{
//        self.demoView.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT /2 - 50, 100, 100);
//    } completion:^(BOOL finished) {
//        self.demoView.frame = CGRectMake(SCREEN_WIDTH / 2 - 50, SCREEN_HEIGHT /2 - 50, 100, 100);
//    }];
    
    // ------------------------------------------------------ //
    
    // 使用 UIView [begin, commit] 模式创建动画
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1.0f];
//    self.demoView.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT / 2 - 50, 100, 100);
//    [UIView commitAnimations];

}
// 透明度动画
- (void)opacityAniamtion {
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anima.fromValue = [NSNumber numberWithFloat:1.0f];
    anima.toValue = [NSNumber numberWithFloat:0.3f];
    anima.duration = 1.0f;
    [self.demoView.layer addAnimation:anima forKey:@"opacityAniamtion"];
    
//    [UIView animateWithDuration:0.75 animations:^{
//        self.demoView.alpha = 0.25;
//    } completion:^(BOOL finished) {
//        self.demoView.alpha = 1;
//    }];
}
// 缩放动画
- (void)scaleAnimation {
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    // anima = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    anima.toValue = [NSNumber numberWithInt:2.0f];
    anima.duration = 1.0f;
    
    // anima = [CABasicAnimation animationWithKeyPath:@"bounds"];
    // anima.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    
    [self.demoView.layer addAnimation:anima forKey:@"scaleAnimation"];
}
// 旋转动画
- (void)rotateAnimation {
    
    // 绕着z轴为矢量，进行旋转
    // CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    // 不写默认z轴 transform.rotation == transform.rotation.z
    // anima.toValue = [NSNumber numberWithFloat:M_PI];
    // anima.duration = 1.0f;
    // [self.demoView.layer addAnimation:anima forKey:@"rotateAnimation"];
    
    // valueWithCATransform3D 作用与 layer
    // CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform"];
    // 绕着矢量（x,y,z）旋转
    // anima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    // anima.duration = 1.0f;
    // anima.repeatCount = MAXFLOAT;
    // [self.demoView.layer addAnimation:anima forKey:@"rotateAnimation"];
    
    // CGAffineTransform作用与View
    [UIView animateWithDuration:0.75 animations:^{
        self.demoView.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished) {
        self.demoView.transform = CGAffineTransformMakeRotation(0);
    }];
    
}
// 背景色变化动画
- (void)backgroundAnimation {
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anima.toValue =(id) [UIColor greenColor].CGColor;
    anima.duration = 1.0f;
    [self.demoView.layer addAnimation:anima forKey:@"backgroundAnimation"];
}

@end
