//
//  WeatherAPI.swift
//  SimpleWeatherApp
//
//  Created by Marina Butovich on 11/2/17.
//  Copyright © 2017 Marinochka. All rights reserved.
//

import Foundation
import CoreLocation

public enum Result<T> {
    case success(T)
    case error(Error)
}

public protocol WeatherAPI {
    func queryWeather(for coordinate: CLLocationCoordinate2D, completion: @escaping (Result<WeatherResponse>)->Void)
}
