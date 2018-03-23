//
//  WelcomeViewModel.swift
//  WeatherApp
//
//  Created by Mac on 2/18/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

class WelcomeViewModel {
    let title: String
    let description: String
    
    init() {
        title = "Welcome!"
        description = "Welcome to the weather app! Before we can show you the weather in your location, you will need to set up your preferences. Swipe left to begin setup."
    }
}
