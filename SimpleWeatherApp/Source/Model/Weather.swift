//
//  Weather.swift
//  SimpleWeatherApp
//
//  Created by Marina Butovich on 11/2/17.
//  Copyright © 2017 Marinochka. All rights reserved.
//

import Foundation
import CoreLocation

struct Weather {
    let location: Location
    let description: String
    let mainParameters: MainWeatherParameters
}

struct MainWeatherParameters {
    let temperature: Double
    let humidity: Double
    let pressure: Double
    let windSpeed: Double
}

struct Location {
    let coordinate: CLLocationCoordinate2D
    let country: String
    let city: String
}
