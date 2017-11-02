//
//  WeatherJSON.swift
//  SimpleWeatherApp
//
//  Created by Marina Butovich on 11/2/17.
//  Copyright © 2017 Marinochka. All rights reserved.
//

import Foundation

public struct WeatherJSON: Decodable {
    let id: Int
    let main: String
    let description: String
}

public struct MainJSON: Decodable {
    let temp: Double
    let pressure: Double
    let humidity: Double
}

public struct SystemJSON: Decodable {
    let country: String
}

public struct WeatherResponse: Decodable {
    let weather: [WeatherJSON]
    let main: MainJSON
    let sys: SystemJSON
    let name: String
}
