//
//  GetLocationViewModel.swift
//  WeatherApp
//
//  Created by Mac on 2/18/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

class GetLocationViewModel {
    let title: String
    let descriptionText: String
    
    init() {
        title = "We need your location!"
        descriptionText = "In order to use this app, your location services must be enabled. Swipe left, press \"Allow\" on the popup box, and then press \"Get My Location\" on the next view to get your current location."
    }
}
