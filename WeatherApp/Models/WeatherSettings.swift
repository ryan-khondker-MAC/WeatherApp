//
//  WeatherSettings.swift
//  WeatherApp
//
//  Created by Mac on 2/18/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

class WeatherSettings {
    enum TemperatureScale : String {
        case Fahrenheit = "Fahrenheit"
        case Celsius = "Celsius"
        
        static var Default: TemperatureScale {
            return .Fahrenheit
        }
    }
    
    static var chosenScale: TemperatureScale {
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "ChosenScale")
        }
        get {
            guard let selected = UserDefaults.standard.object(forKey: "ChosenScale") as? String else {
                return TemperatureScale.Default
            }
            return TemperatureScale(rawValue: selected) ?? TemperatureScale.Default
        }
    }
    
    static var zipCode: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: "ZipCode")
        }
        get {
            return UserDefaults.standard.object(forKey: "ZipCode") as? String
        }
    }
    
    static var locationName: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: "LocationName")
        }
        get {
            return UserDefaults.standard.object(forKey: "LocationName") as? String
        }
    }
    
    static var setupComplete: Bool {
        return zipCode != nil
    }
}
