//
//  RNRootView.m
//  HelloRN
//
//  Created by yuki on 16/1/29.
//  Copyright © 2016年 kang.yu.sh. All rights reserved.
//

#import "RNRootView.h"

@implementation RNRootView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        NSURL *jsCodeLocation;
        //获取index.ios.bundle的地址。
        jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios&dev=true"];
//          jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"jsbundle"];
        //植入到JS
        NSDictionary *dict1 =[NSDictionary dictionaryWithObjectsAndKeys:@"http://bikectrip.aliapp.com/static/flaskIcon.png",@"imageURI",@"用户头像",@"title", nil];
        NSDictionary *dict2 =[NSDictionary dictionaryWithObjectsAndKeys:@"http://bikectrip.aliapp.com/static/weixin.png",@"imageURI",@"用户二维码",@"title", nil];
        NSArray *imageList = [NSArray arrayWithObjects:dict1,dict2, nil];
        RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation moduleName:@"yukingApp" initialProperties:@{@"images":imageList} launchOptions:nil];
        rootView.frame =self.frame;
        [self addSubview:rootView];
    }
    
    return self;
}

@end
