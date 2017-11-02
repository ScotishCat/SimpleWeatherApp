//
//  WeatherAPI.swift
//  SimpleWeatherApp
//
//  Created by Marina Butovich on 11/2/17.
//  Copyright © 2017 Marinochka. All rights reserved.
//

import Foundation
import CoreLocation

public class WeatherProvider: WeatherAPI {
    public private(set) var baseURL: URL

    private let APIKey = "0b2b7c18687c027e12e2052ef1bb4fd6"
    public init?(baseURL: String) {
        guard let url = URL(string: baseURL) else {
            return nil
        }
        
        self.baseURL = url
    }
    
    public typealias Completion = (Result<WeatherResponse>)->Void
    
    public func queryWeather(for coordinate: CLLocationCoordinate2D, completion: @escaping Completion) {
        let urlString = "weather?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&APPID=\(self.APIKey)"
        let url = URL(string: urlString, relativeTo: self.baseURL)
        guard let requestUrl = url else {
            completion(.error(NSError(domain: "com.test", code: -100, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: requestUrl) {
            (data, response, error) in
            
            guard let jsonData = data else {
                completion(.error(NSError(domain: "com.test", code: -100, userInfo: nil)))
                return
            }

            let decoder = JSONDecoder()
            let weather = try! decoder.decode(WeatherResponse.self, from: jsonData)
            completion(.success(weather))
            
        }.resume()
    }
}

