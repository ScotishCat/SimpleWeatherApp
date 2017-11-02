//
//  AppDelegate.swift
//  SimpleWeatherApp
//
//  Created by Marina Butovich on 11/2/17.
//  Copyright © 2017 Marinochka. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.appCoordinator = AppCoordinator(api: WeatherProvider(baseURL: "http://api.openweathermap.org/data/2.5/")!)
        self.appCoordinator.start(with: launchOptions, window: self.window!)
        
        return true
    }
}

