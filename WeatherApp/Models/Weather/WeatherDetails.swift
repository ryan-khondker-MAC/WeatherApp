//
//  WeatherDetails.swift
//  WeatherApp
//
//  Created by Mac on 2/19/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

struct WeatherDetails : Codable {
    var weatherConditions: [WeatherCondition]
    var mainWeatherData: MainWeatherData
    var windData: WindData
    var cloudData: CloudData
    
    enum CodingKeys : String, CodingKey {
        case weatherConditions = "weather"
        case mainWeatherData = "main"
        case windData = "wind"
        case cloudData = "clouds"
    }
}
