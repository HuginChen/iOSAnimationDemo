//
//  ComprehensiveCaseController.m
//  iOSAnimationDemo
//
//  Created by Hugin on 2018/12/13.
//  Copyright © 2018 Hugin. All rights reserved.
//

#import "ComprehensiveCaseController.h"
#import "DCPathButton.h"

@interface ComprehensiveCaseController ()
@property (nonatomic , strong) DCPathButton *pathAnimationView;
@end

@implementation ComprehensiveCaseController
- (void)initView {
    [super initView];
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    
    // https://github.com/Tangdixi/DCPathButton
    // https://github.com/dwalker39/DWBubbleMenuButton
    // https://github.com/matthewcheok/MCFireworksButton
    UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 200, SCREEN_WIDTH, 20)];
    l1.text = @" github.com/Tangdixi/DCPathButton";
    UILabel *l2 = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 160, SCREEN_WIDTH, 20)];
    l2.text = @" github.com/dwalker39/DWBubbleMenuButton";
    UILabel *l3 = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 120, SCREEN_WIDTH, 20)];
    l3.text = @" github.com/matthewcheok/MCFireworksButton";
    [self.view addSubview:l1];
    [self.view addSubview:l2];
    [self.view addSubview:l3];
    
    [self pathAnimation];
    [self dingdingAnimation];
    [self clickGoodAnimation];
}
- (NSString *)controllerTitle {
    return @"综合案例";
}

- (void)pathAnimation {
    DCPathButton *dcPathButton = [[DCPathButton alloc] initWithButtonFrame:CGRectMake(SCREEN_WIDTH/3 - 25, 200, 50, 50) centerImage:[UIImage imageNamed:@"chooser-tab"] highlightedImage:[UIImage imageNamed:@"chooser-tab-highlighted"]];
    
    // dcPathButton.delegate = self;
    DCPathItemButton *itemButton_1 = [[DCPathItemButton alloc] initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"]
                                                            highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"]
                                                             backgroundImage:[UIImage imageNamed:@"chooser-moment"]
                                                  backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-highlighted"]];
    
    DCPathItemButton *itemButton_2 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-place"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-place-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-highlighted"]];
    
    DCPathItemButton *itemButton_3 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-camera"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-camera-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-highlighted"]];
    
    DCPathItemButton *itemButton_4 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-thought"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-thought-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-highlighted"]];
    
    DCPathItemButton *itemButton_5 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-sleep"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-sleep-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-highlighted"]];
    
    
    [dcPathButton addPathItems:@[itemButton_1, itemButton_2, itemButton_3, itemButton_4, itemButton_5]];
    _pathAnimationView = dcPathButton;
    [self.view addSubview:dcPathButton];
}
- (void)dingdingAnimation {}
- (void)clickGoodAnimation {}
@end
