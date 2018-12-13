//
//  BaseViewController.h
//  iOSAnimationDemo
//
//  Created by Hugin on 2018/12/12.
//  Copyright © 2018 Hugin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

/** 当前Controller的标题 */
- (NSString *)controllerTitle;

/** 初始化View */
-(void)initView;

/** 子类继承返回按钮操作区的数组元素 */
- (NSArray *)operateTitleArray;

/** 子类继承响应按钮的点击事件 */
- (void)clickBtn:(UIButton *)btn;

@end

NS_ASSUME_NONNULL_END
