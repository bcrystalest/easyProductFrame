//
//  AppDelegate.m
//  productFrame
//
//  Created by 陈威利 on 2017/11/6.
//  Copyright © 2017年 陈威利. All rights reserved.
//

#import "AppDelegate.h"
#import "newViewController.h"
#import "GuideViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    foreoWeakSelf;
    
    // 1.创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    NSUserDefaults *useDef = [NSUserDefaults standardUserDefaults];
    //判断是否第一次进入
    if (![useDef objectForKey:@"First2"]) {
        //第一次进入显示新手引导
//        GuideViewController *guide = [[GuideViewController alloc]init];
        // 2.设置窗口的根控制器
        rootIncludeController *vc = [rootIncludeController new];
        subModelForIncludeController *guideModel = [subModelForIncludeController new];
        guideModel.selfViewController = [GuideViewController new];
        subModelForIncludeController *mainPageModel = [subModelForIncludeController new];
        mainPageModel.selfViewController = [customTabBarController new];
        vc.vcArray = [NSMutableArray arrayWithObjects:guideModel,mainPageModel, nil];
        [vc inSequence];
        self.window.rootViewController = vc;

    }else{
        //显示主页面
        newViewController *vc = [newViewController new];
        // 2.设置窗口的根控制器
        self.window.rootViewController = vc;
        vc.block = ^{
//            productMainTabBarController *tabBarVC = [[productMainTabBarController alloc]init];
//            weakSelf.window.rootViewController = tabBarVC;
        };
    }
//    productMainTabBarController *tabBarVC = [[productMainTabBarController alloc]init];
//    weakSelf.window.rootViewController = tabBarVC;
    // 3.显示窗口
    [self.window makeKeyAndVisible];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
