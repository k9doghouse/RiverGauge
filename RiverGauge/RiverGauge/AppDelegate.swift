//
//  AppDelegate.swift
//  RiverGauge
//
//  Created by Arthur Murphy on 10/10/17.
//  Copyright © 2017 MurphySpringsLodge. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }
    func applicationDidEnterBackground(_ application: UIApplication) { }
    func applicationWillEnterForeground(_ application: UIApplication) { }
    func applicationDidBecomeActive(_ application: UIApplication) { }
    func applicationWillTerminate(_ application: UIApplication) { }

    func applicationShouldTerminateAfterLastWindowClosed(sender: UIApplication) -> Bool {
        return true
    }
}
