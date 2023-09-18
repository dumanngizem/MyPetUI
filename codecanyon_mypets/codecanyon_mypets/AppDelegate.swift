//
//  AppDelegate.swift
//  codecanyon_mypets
//
//  Created by Gizem Duman on 18.09.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let VC = SplashViewController()
        let nav = UINavigationController(rootViewController: VC)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = nav
        return true
    }
}
