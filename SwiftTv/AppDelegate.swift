//
//  AppDelegate.swift
//  SwiftTv
//
//  Created by Micaela Nuñez on 04/02/2020.
//  Copyright © 2020 Micaela Nuñez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let screenFrame = UIScreen.main.bounds
        
        let mainView = MenuBuilder.build()
        
        window = UIWindow(frame: screenFrame)
        window?.rootViewController =  UINavigationController(rootViewController: mainView)
        window?.makeKeyAndVisible()
        
        return true
    }

    


}

