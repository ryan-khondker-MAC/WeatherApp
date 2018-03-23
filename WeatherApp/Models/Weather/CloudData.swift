//
//  CloudData.swift
//  WeatherApp
//
//  Created by Mac on 2/19/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

struct CloudData : Codable {
    var cloudiness: Int
    
    enum CodingKeys : String, CodingKey {
        case cloudiness = "all"
    }
}
