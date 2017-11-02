//
//  Storyboard.swift
//  SimpleWeatherApp
//
//  Created by Marina Butovich on 11/2/17.
//  Copyright © 2017 Marinochka. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case mapScreen = "MapViewStoryboard"
    case weatherDetails = "WeatherDetailsStoryboard"
    
    private func getStoryboard() -> UIStoryboard {
        let rawValue = self.rawValue
        return UIStoryboard(name: rawValue, bundle: nil)
    }
    
    func instantiateViewController<T: UIViewController>() -> T? {
        let storyboard = self.getStoryboard()
        let identifier = String(describing: T.self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as? T
    }

    func instantiateInitialViewController() -> UIViewController? {
        return self.getStoryboard().instantiateInitialViewController()
    }
}
