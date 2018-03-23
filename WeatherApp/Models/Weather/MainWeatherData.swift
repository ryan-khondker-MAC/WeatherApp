//
//  MainWeatherData.swift
//  WeatherApp
//
//  Created by Mac on 2/19/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

struct MainWeatherData : Codable {
    var currentTemp: Double
    var minTemp: Double
    var maxTemp: Double
    var humidity: Int
    
    var convertedCurrentTemp: Int {
        get {
            switch WeatherSettings.chosenScale {
            case .Fahrenheit:
                return tempToFahrenheit(currentTemp)
            case .Celsius:
                return tempToCelsius(currentTemp)
            }
        }
    }
    
    var convertedMinTemp: Int {
        get {
            switch WeatherSettings.chosenScale {
            case .Fahrenheit:
                return tempToFahrenheit(minTemp)
            case .Celsius:
                return tempToCelsius(minTemp)
            }
        }
    }
    
    var convertedMaxTemp: Int {
        get {
            switch WeatherSettings.chosenScale {
            case .Fahrenheit:
                return tempToFahrenheit(maxTemp)
            case .Celsius:
                return tempToCelsius(maxTemp)
            }
        }
    }
    
    private func tempToFahrenheit(_ tempToConvert: Double) -> Int {
        return Int((tempToConvert * 1.8) - 459.67)
    }
    
    private func tempToCelsius(_ tempToConvert: Double) -> Int {
        return Int(tempToConvert - 273.15)
    }
    
    enum CodingKeys : String, CodingKey {
        case currentTemp = "temp"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
        case humidity
    }
}
