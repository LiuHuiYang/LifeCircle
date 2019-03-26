//
//  AppDelegate.swift
//  LifeCircle
//
//  Created by Apple on 2019/3/25.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
    
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController =
            isLatestVersion() ?
                HYMainViewController() :
                HYNewFeaturesCollectionViewController()
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
    /// 当前应用是是最新版本
    private func isLatestVersion() -> Bool {
        
        return false
        
        // 获得沙盒版本
        let sandVersion = UserDefaults.standard.object(forKey: currentVersionKey) as? String
        
        // 获当前版本
        let latestVersion = UIApplication.applicationVersion()
        
        // 记录最新版本
        UserDefaults.standard.set(
            latestVersion,
            forKey: currentVersionKey
        )
        
        UserDefaults.standard.synchronize()
        
        return sandVersion == latestVersion
    }

    func applicationWillResignActive(_ application: UIApplication) {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
      
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
       
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
       
    }


}

