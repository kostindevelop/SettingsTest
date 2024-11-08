//
//  AppDelegate.swift
//  SettingsApp
//
//  Created by Konstantin Antonyuk on 08.11.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        appCoordinator = AppCoordinator()
        appCoordinator.start()
        
        return true
    }
}

