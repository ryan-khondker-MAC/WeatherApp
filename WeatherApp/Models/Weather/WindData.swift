//
//  WindData.swift
//  WeatherApp
//
//  Created by Mac on 2/19/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

struct WindData : Codable {
    var speed: Double
    var direction: Double
    
    enum CodingKeys : String, CodingKey {
        case speed
        case direction = "deg"
    }
}
