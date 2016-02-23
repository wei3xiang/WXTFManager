//
//  AppDelegate.swift
//  WXTFManager
//
//  Created by 魏翔 on 16/2/23.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        self.window = window
        
        let navigationVC = UINavigationController()
        
        let homeVC = MainVC.init(nibName:"MainVC", bundle: nil)
        
        navigationVC.viewControllers = [homeVC]
        
        window.rootViewController = navigationVC
        
        window.makeKeyAndVisible()
        
        return true
    }
}

