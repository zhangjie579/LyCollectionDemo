//
//  IWDiscoverViewController.m
//  LYCycleDemo
//
//  Created by 张杰 on 2017/1/17.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "IWDiscoverViewController.h"
#import "LyButton.h"
#import "LyShowView.h"

@interface IWDiscoverViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)LyButton *btn;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)LyShowView   *showView;
@end

@implementation IWDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.btn];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell %ld",indexPath.row];
    
    return cell;
}

//得到上一次的Y
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat y = scrollView.contentOffset.y;
    
        NSLog(@"%@",NSStringFromCGRect(self.navigationController.navigationBar.frame));
    
//    NSLog(@"y   %f",y);
    CGRect rect = self.navigationController.navigationBar.frame;
    
    rect.origin.y = rect.origin.y - y;
    
    if (rect.origin.y >= 20)
    {
        rect.origin.y = 20;
    }else if (rect.origin.y <= -24)
    {
        rect.origin.y = -24;
    }
    
    CGFloat scrY = self.navigationController.navigationBar.frame.origin.y - rect.origin.y;
    
    
    CGRect tableRect = self.tableView.frame;
    
    tableRect.origin.y = tableRect.origin.y - scrY;
    tableRect.size.height = tableRect.size.height + scrY;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.navigationController.navigationBar.frame = rect;
        self.tableView.frame = tableRect;
    }];
    
}

- (void)btnClick
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.showView];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight - NavBarHeight);
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = 60;
        //        _tableView.sectionHeaderHeight = 120;
    }
    return _tableView;
}

- (LyButton *)btn
{
    if (!_btn) {
        _btn = [[LyButton alloc] init];
        _btn.frame = CGRectMake(19, ScreenHeight - NavBarHeight - BottomHeight, 60, 60);
        _btn.scrollView = self.tableView;
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (LyShowView *)showView
{
    if (!_showView) {
        _showView = [[LyShowView alloc] init];
        _showView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    }
    return _showView;
}

@end
