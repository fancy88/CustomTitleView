//
//  TitleTypeView.h
//  CustomTitleView
//
//  Created by apple on 17/1/20.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TitleTypeViewDelegate <NSObject>

- (void)select: (id)typeView index: (NSInteger)index;

@end

@interface TitleTypeView : UIButton<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id<TitleTypeViewDelegate>delegate;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
- (void)setArr: (NSMutableArray *)array;
@end
