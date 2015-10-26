//
//  AppDelegate.swift
//  AntiqueMarket
//
//  Created by super on 15/10/24.
//  Copyright © 2015年 super. All rights reserved.
//

import UIKit


@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //MARK: - - 程序启动时执行
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window    = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor    = UIColor.whiteColor()
        window?.rootViewController = setAMTabbarController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    //MARK: - - 设置Tabbar
    func setAMTabbarController()->UITabBarController{
        let myTabbarController = UITabBarController()
        // 设置为不透明
        myTabbarController.tabBar.translucent = false;
        // 这个也可以设置选中的颜色
//        tabbarController.tabBar.tintColor = UIColor.redColor();
        // 首页
        let homeVC = AMFirstVC()
        // 艺市
        let marketVC = AMSecondVC()
        // 个人中心
        let userCenterVC = AMThirdVC()
//        let childVCArray:[UIViewController] = [homeVC,marketVC,userCenterVC]
//        let childVCTitleArray = ["首页","艺市","我的"]
//        let childVCImageNameArray = ["tab_home","tab_shopping","tab_user"]
//        let childVCSelectedImageNameArray = ["tab_home_pre","tab_shopping_pre","tab_user_pre"]
//        for i in 0 ... childVCArray.count - 1{
//            addChildVC(childVCArray[i], childVCTitle: childVCTitleArray[i], childVCImageName: childVCImageNameArray[i], childVCSelectedImageName: childVCSelectedImageNameArray[i], tabbarController: myTabbarController)
//        }
        
        addChildVC(homeVC, childVCTitle: "首页", childVCImageName: "tab_home", childVCSelectedImageName: "tab_home_pre", tabbarController: myTabbarController)
        addChildVC(marketVC, childVCTitle: "艺市", childVCImageName: "tab_shopping", childVCSelectedImageName: "tab_shopping_pre", tabbarController: myTabbarController)
        addChildVC(userCenterVC, childVCTitle: "我的", childVCImageName: "tab_user", childVCSelectedImageName: "tab_user_pre", tabbarController: myTabbarController)
        return myTabbarController;
    }
    //MARK: - - 把各个VC布置到tabbarController上
    func addChildVC(childVC:UIViewController,childVCTitle:String,childVCImageName:String,childVCSelectedImageName:String,tabbarController:UITabBarController){
        // 设置标题
        childVC.tabBarItem.title = childVCTitle;
        // tabbar默认图片
        childVC.tabBarItem.image = UIImage(named: childVCImageName)
        // tabbar选中图片
        childVC.tabBarItem.selectedImage = UIImage(named: childVCSelectedImageName)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        // 设置点击前后的文字颜色
      UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.blackColor()], forState: UIControlState.Normal)
      UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.redColor()], forState: UIControlState.Selected)
       

        tabbarController.addChildViewController(childVC);
        
        
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

