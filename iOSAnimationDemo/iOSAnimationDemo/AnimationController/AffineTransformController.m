//
//  AffineTransformController.m
//  iOSAnimationDemo
//
//  Created by Hugin on 2018/12/13.
//  Copyright © 2018 Hugin. All rights reserved.
//

#import "AffineTransformController.h"

@interface AffineTransformController ()
@property (nonatomic, strong) UIView *demoView;
@end

@implementation AffineTransformController
 
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
    return @[@"位移", @"缩放", @"旋转", @"组合", @"反转"];
}
- (NSString *)controllerTitle {
    return @"仿射变换";
}
-(void)clickBtn:(UIButton *)btn {
    switch (btn.tag) {
        case 0:
            [self positionAnimation];
            break;
        case 1:
            [self scaleAnimation];
            break;
        case 2:
            [self rotateAnimation];
            break;
        case 3:
            [self combinationAnimation];
            break;
        case 4:
            [self invertAnimation];
            break;
    }
}
- (void)positionAnimation {
    [UIView animateWithDuration:0.75 animations:^{
        self.demoView.transform = CGAffineTransformMakeTranslation(100, 100); // 位移
    } completion:^(BOOL finished) {
        self.demoView.transform = CGAffineTransformIdentity; // 还原状态
    }];
}
- (void)scaleAnimation {
    [UIView animateWithDuration:0.75 animations:^{
        self.demoView.transform = CGAffineTransformMakeScale(2, 2); // 缩放
    } completion:^(BOOL finished) {
        self.demoView.transform = CGAffineTransformIdentity; // 还原状态
    }];
}
- (void)rotateAnimation {
    [UIView animateWithDuration:0.75 animations:^{
        self.demoView.transform = CGAffineTransformMakeRotation(M_PI); // 旋转
    } completion:^(BOOL finished) {
        self.demoView.transform = CGAffineTransformIdentity; // 还原状态
    }];
}
- (void)combinationAnimation {
    [UIView animateWithDuration:0.75 animations:^{
        // 仿射变换的组合使用
        CGAffineTransform transform1 = CGAffineTransformMakeRotation(M_PI);
        CGAffineTransform transform2 = CGAffineTransformScale(transform1, 0.5, 0.5);
        self.demoView.transform = CGAffineTransformTranslate(transform2, 100, 100);
    } completion:^(BOOL finished) {
        self.demoView.transform = CGAffineTransformIdentity; // 还原状态
    }];
}
- (void)invertAnimation {
    [UIView animateWithDuration:0.75 animations:^{
        self.demoView.transform = CGAffineTransformInvert(CGAffineTransformMakeScale(0.5, 0.5));; // 矩阵反转
    } completion:^(BOOL finished) {
        self.demoView.transform = CGAffineTransformIdentity; // 还原状态
    }];
}

@end
