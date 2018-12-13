//
//  BaseViewController.m
//  iOSAnimationDemo
//
//  Created by Hugin on 2018/12/12.
//  Copyright © 2018 Hugin. All rights reserved.
//

#import "BaseViewController.h"
#import "SWRevealViewController.h"

@interface BaseViewController ()
@property (nonatomic , strong) NSArray *operateTitleArray;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    [self initView];
}

- (void)initData {
    _operateTitleArray = [self operateTitleArray] ?: [NSArray array];
}

- (void)initView {
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH ,60)];
    containerView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:containerView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [self controllerTitle];
    [containerView addSubview:label];
    
    self.view.backgroundColor = [UIColor whiteColor];
    if(_operateTitleArray && _operateTitleArray.count > 0){
        
        NSUInteger row = _operateTitleArray.count %4 == 0 ? _operateTitleArray.count / 4 : _operateTitleArray.count / 4+1;
        UIView *operateView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - (row * 50 + 20), SCREEN_WIDTH, row * 50 + 20)];
        [self.view addSubview:operateView];
        
        for (int i=0; i<_operateTitleArray.count; i++) {
            UIButton *btn = [[UIButton alloc] initWithFrame:[self rectForBtnAtIndex:i totalNum:_operateTitleArray.count]];
            [btn setTitle:[_operateTitleArray objectAtIndex:i] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            btn.backgroundColor = [UIColor grayColor];
            btn.tag = i;
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            [operateView addSubview:btn];
        }
    }
    // 注册该页面可以执行滑动切换
    SWRevealViewController *revealController = self.revealViewController;
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
}
- (void)clickBtn:(UIButton *)btn{
    
}
- (CGRect)rectForBtnAtIndex:(NSUInteger)index totalNum:(NSUInteger)totleNum{
    // 每一行最多显示4个
    NSUInteger maxColumnNum = 4;
    // 每个按钮的间距
    CGFloat margin = 20;
    // 行数
    NSUInteger row = index / maxColumnNum;
    // 列数
    NSUInteger column = index % maxColumnNum;
    // 每个按钮的宽度
    CGFloat width = (SCREEN_WIDTH - margin * 5) / 4;
    // 每个按钮的高度
    CGFloat height = 30;
    // 每个按钮的偏移
    CGFloat offsetX = margin + column * (width + margin);
    CGFloat offsetY = margin + row * (height + margin);
    
    return CGRectMake(offsetX, offsetY, width, height);
}

- (NSString *)controllerTitle{
    return @"默认标题";
}

@end
