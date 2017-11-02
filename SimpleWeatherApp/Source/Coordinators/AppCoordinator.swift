//
//  AppCoordinator.swift
//  SimpleWeatherApp
//
//  Created by Marina Butovich on 11/2/17.
//  Copyright © 2017 Marinochka. All rights reserved.
//

import UIKit
import CoreLocation

/**
 The main entry point to the application-level flow logic
 */
class AppCoordinator {
    var mainWindow: UIWindow!
    var navigationController: UINavigationController!
    var weatherAPI: WeatherAPI!
    
    init(api: WeatherAPI) {
        self.weatherAPI = api
    }
    
    func start(with launchOptions: [UIApplicationLaunchOptionsKey: Any]?, window: UIWindow) {
        self.mainWindow = window
        
        let controller: MapViewController? = Storyboard.mapScreen.instantiateViewController()
        guard let mapViewController = controller else {
            assertionFailure("Failed to instantiate MapViewController!")
            return
        }
        mapViewController.delegate = self
        
        let navController = UINavigationController(rootViewController: mapViewController)
        self.navigationController = navController
        self.mainWindow.rootViewController = navController
        self.mainWindow.makeKeyAndVisible()
    }
}

extension AppCoordinator: MapControllerDelegate {
    
    func userTappedOnLocation(coordinate: CLLocationCoordinate2D) {
        // TODO: Show progress indicator
        self.weatherAPI.queryWeather(for: coordinate) {
            (result) in
            
            guard case .success(let weatherResponse) = result else {
                // TODO: Handle error
                return
            }
            
            DispatchQueue.main.async {
                let controller: WeatherDetailsController? = Storyboard.weatherDetails.instantiateViewController()
                guard let detailsController = controller else {
                    assertionFailure("Failed to instantiate MapViewController!")
                    return
                }
                
                let weather = self.buildWeather(from: weatherResponse, coordinate: coordinate)
                detailsController.fillWithWeather(weather: weather)
                
                self.navigationController.pushViewController(detailsController, animated: true)
            }
        }
    }
    
    func buildWeather(from weatherResponse: WeatherResponse, coordinate: CLLocationCoordinate2D) -> Weather {
        let location = Location(coordinate: coordinate, country: weatherResponse.sys.country, city: weatherResponse.name)
        let main = weatherResponse.main
        let mainParams = MainWeatherParameters(temperature: main.temp, humidity: main.humidity, pressure: main.pressure, windSpeed: 0.0)
        let result = Weather(location: location, description: weatherResponse.weather.first!.main, mainParameters: mainParams)
        
        return result
    }
}
