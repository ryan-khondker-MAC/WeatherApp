//
//  WeatherCondition.swift
//  WeatherApp
//
//  Created by Mac on 2/19/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

struct WeatherCondition : Codable {
    var description: String
    var icon: String
    
    enum CodingKeys : String, CodingKey {
        case description
        case icon
    }
}
