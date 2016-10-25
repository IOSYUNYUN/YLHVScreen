//
//  AppDelegate.m
//  YLHVScreen
//
//  Created by 刘云 on 2016/10/25.
//  Copyright © 2016年 YouLing. All rights reserved.
//

#import "AppDelegate.h"
#import "YLSupportViewController.h"
#import "YLNotSupportViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UITabBarController* tabBar = [[UITabBarController alloc] init];
    //支持横屏的viewcontroller
    YLSupportViewController* supportViewController = [[YLSupportViewController alloc] init];
    supportViewController.tabBarItem.title = @"支持横屏";
    //不支持横屏的viewcontroller
    YLNotSupportViewController* notsupportViewControllrt = [[YLNotSupportViewController alloc] init];
    notsupportViewControllrt.tabBarItem.title = @"不支持横屏";
    tabBar.viewControllers = @[supportViewController,notsupportViewControllrt];
    self.window.rootViewController = tabBar;
    [self.window makeKeyAndVisible];
    return YES;
}
//每次调用viewcontroller时都要调用这个函数来判断是否支持横屏
-(UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    
    
    //获取当前
    UIViewController* currentViewController = [self topViewController];
    NSString* str_name = NSStringFromClass([currentViewController class]);
    NSLog(@"%@",str_name);
   id th =  [UIApplication sharedApplication].windows.lastObject;
    NSLog(@"%@",NSStringFromClass([th class]));
    //str_name 是不让炫转的类名
    if([str_name  isEqual: @"YLNotSupportViewController"])
    {
        //返回为不支持旋转
         return UIInterfaceOrientationMaskPortrait;
    }
     //支持UpsideDown意外的所有的旋转
    return UIInterfaceOrientationMaskAllButUpsideDown;

   
}
//找到当前keyWindow的rootVC
- (UIViewController*)topViewController
{
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

//通过rootVC找到当前相应的VC
- (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController
{
    //
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    }
    else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    }
    else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    }
    else {
        return rootViewController;
    }
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
