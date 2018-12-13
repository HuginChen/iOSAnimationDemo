//
//  LeftViewController.m
//  iOSAnimationDemo
//
//  Created by Hugin on 2018/12/13.
//  Copyright © 2018 Hugin. All rights reserved.
//

#import "LeftViewController.h"
#import "SWRevealViewController.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *menuArray;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (void)initData{
    _menuArray = @[@"基础动画", @"关键帧动画", @"组动画", @"过渡动画", @"仿射变换", @"综合案例"];
}

- (void)initView{
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableHeaderView = [UIView new];
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _menuArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    cell = cell ? : [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
    cell.textLabel.text = [_menuArray objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SWRevealViewController *revealViewController = self.revealViewController;
    UIViewController *vc;
    
    switch (indexPath.row) {
        case 0:
            vc = [NSClassFromString(@"BaseAnimationController") new];
            break;
        case 1:
            vc = [NSClassFromString(@"KeyFrameAnimationController") new];
            break;
        case 2:
            vc = [NSClassFromString(@"GroupAnimationController") new];
            break;
        case 3:
            vc = [NSClassFromString(@"TransitionAnimationController") new];
            break;
        case 4:
            vc = [NSClassFromString(@"AffineTransformController") new];
            break;
        case 5:
            vc = [NSClassFromString(@"ComprehensiveCaseController") new];
            break;
    }
    [revealViewController pushFrontViewController:vc animated:YES];
}


@end
