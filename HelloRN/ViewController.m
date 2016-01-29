//
//  ViewController.m
//  HelloRN
//
//  Created by yuki on 16/1/27.
//  Copyright © 2016年 kang.yu.sh. All rights reserved.
//

#import "ViewController.h"
#import "RNRootView.h"
#import "RCTMaperManager.h"

@interface ViewController (){
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RNRootView *rnView = [[RNRootView alloc]initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:rnView];
    
//    RCTMaperManager *mp = [[RCTMaperManager alloc]init];
//    UIView *v = [mp view];
//    v.frame = self.view.frame;
//    [self.view addSubview:v];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
