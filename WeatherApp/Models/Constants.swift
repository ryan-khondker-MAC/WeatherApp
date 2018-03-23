//
//  Constants.swift
//  WeatherApp
//
//  Created by Mac on 2/19/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class Constants {
    static let kWeatherApiUrlBeforeZipCode = "https://api.openweathermap.org/data/2.5/weather?zip="
    static let kWeatherApiUrlAfterZipCode = ",us&APPID=c4a4d7e0b3a596c0610cfea3849d19ea"
    static let kWeatherIconBaseUrl = "https://openweathermap.org/img/w/"
    static let kWeatherIconUrlEnd = ".png"
    
    static let kFahrenheitThreshold = 70
    static let kCelsiusThreshold = 20
    static var kThresholdForColor: Int {
        switch WeatherSettings.chosenScale {
        case .Fahrenheit:
            return kFahrenheitThreshold
        case .Celsius:
            return kCelsiusThreshold
        }
    }
    
    static let coldColor = UIColor(red: 204/255, green: 1, blue: 1, alpha: 1)
    static let hotColor = UIColor(red: 1, green: 136/255, blue: 136/255, alpha: 1)
}
