//
//  TitleTypeView.m
//  CustomTitleView
//
//  Created by apple on 17/1/20.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "TitleTypeView.h"

@implementation TitleTypeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self getUI];
    }
    return self;
}

- (void)getUI{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 0) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self addSubview:self.tableView];
    
    self.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:241/255.0 alpha:0.7];
    [self addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setArr:(NSMutableArray *)array{
    self.dataArr = array;
    if (array.count <= 10) {
        self.tableView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 44 * array.count);
        self.tableView.scrollEnabled = NO;
    }else{
        self.tableView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 440);
        self.tableView.scrollEnabled = YES;
    }
}

- (void)hide{
    self.hidden = YES;
}

#pragma mark - UITableViewTableView & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
       cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.delegate select:self index:indexPath.row];
    [self hide];
}


@end
