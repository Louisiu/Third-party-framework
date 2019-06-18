//
//  ViewController.m
//  afn_demo
//
//  Created by liufengshuo on 2018/4/17.
//  Copyright © 2018年 liufengshuo. All rights reserved.
//

/*
 
 
 
 */

/*
 urlStr = @"http://api.douban.com/v2/movie/top250";
 
     NSDictionary *dic = @{@"start":@(1),
     @"count":@(5)
     };
 */

#import "ViewController.h"
/*
 1.发起请求：urlsessionmanager 减少了主类的复杂度，提高维护
 2.请求过程 delegate
 3.请求完成 delegate
 
 系统原生的进度是通过代理
 af提供了block
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self get];
    
}

//url-request-session-task-resume
/*
 初始化：1.初始化session；2.设置很多默认值
 get:
 1.在生成request的时候处理了监听request的属性变化；
 2.参数转查询字符串；
 3.生成任务安全；
 4.通过AFURLSessionManagerTaskDelegate使得我们的进度可以通过block回调；
 5.通过AFURLSessionManagerTaskDelegate拼接我们的服务器返回数据
 */
- (void)get{
  
    NSString *urlStr = @"https://api.douban.com/v2/movie/top250";
    NSDictionary *dic = @{@"start":@(1),
                          @"count":@(5)
                          };
    // manager : 什么设计模式？
    // 线程 -- 2.0 常驻线程  -- 3.0 
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.requestSerializer.timeoutInterval = 5;
    [manager GET:urlStr parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
