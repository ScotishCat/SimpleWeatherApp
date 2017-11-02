//
//  WeatherDetailsViewController.swift
//  SimpleWeatherApp
//
//  Created by Marina Butovich on 11/2/17.
//  Copyright © 2017 Marinochka. All rights reserved.
//

import UIKit

class WeatherDetailsController: UIViewController {
    
    @IBOutlet private weak var placeNameLabel: UILabel!
    
    @IBOutlet private weak var longitudeLabel: UILabel! {
        didSet {
            longitudeLabel.textColor = UIColor.gray
        }
    }
    
    @IBOutlet private weak var latitudeLabel: UILabel! {
        didSet {
            latitudeLabel.textColor = UIColor.gray
        }
    }
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var pressureLabel: UILabel!
    @IBOutlet private weak var windSpeedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fillWithWeather(weather: Weather) {
        let _ = self.view
        let country = weather.location.country
        // if country is empty -> it's USA
        placeNameLabel.text = weather.location.city + "," + (country != "" ? country : "USA")
        longitudeLabel.text = String(format:"%.3f", weather.location.coordinate.longitude as Double)
        latitudeLabel.text = String(format:"%.3f", weather.location.coordinate.latitude as Double)
        descriptionLabel.text = weather.description
        temperatureLabel.text = String(format:"Temperature: %.2f", weather.mainParameters.temperature)
        humidityLabel.text = String(format:"Humidity: %.2f", weather.mainParameters.humidity)
        pressureLabel.text = String(format:"Pressure: %.2f", weather.mainParameters.pressure)
        windSpeedLabel.text = String(format:"Wind Speed: %.2f", weather.mainParameters.windSpeed)
    }
}
