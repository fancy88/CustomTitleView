//
//  ViewController.m
//  CustomTitleView
//
//  Created by apple on 17/1/20.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HomeViewController.h"
#import "TitleTypeView.h"

@interface HomeViewController ()<TitleTypeViewDelegate>{
    NSMutableArray *mDataArr;
    UIButton *mButton;
    TitleTypeView *titleView;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    mDataArr = [NSMutableArray arrayWithObjects:@"one",@"two",@"three",@"foure",@"five",nil];
    [self setNavigation];
}

- (void)setNavigation{
    mButton = [UIButton buttonWithType:UIButtonTypeCustom];
    mButton.frame = CGRectMake(0, 0, 50, 30);
    [mButton setTitle:@"你好" forState:UIControlStateNormal];
    [mButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [mButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = mButton;
}

- (void)buttonAction{
    NSLog(@"hello world");
    if (!titleView) {
        titleView = [[TitleTypeView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
        titleView.delegate = self;
        [titleView setArr:mDataArr];
        [self.view addSubview:titleView];
    }else{
        titleView.hidden = !titleView.hidden;
    }
}

#pragma mark - TitleTypeViewDelegate
- (void)select: (id)typeView index: (NSInteger)index{
    NSLog(@"点击了 %@",mDataArr[index]);
    [mButton setTitle:mDataArr[index] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
