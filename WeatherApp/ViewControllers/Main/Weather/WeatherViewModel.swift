//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mac on 2/19/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

class WeatherViewModel {
    var weatherDetails = Dynamic<WeatherDetails>(nil)
    var weatherError = Dynamic<Error>(nil)
    var imageData = Dynamic<Data>(nil)
    var imageError = Dynamic<Error>(nil)
    
    func setup() {
        self.getWeatherDetails()
    }
    
    private func getWeatherDetails() {
        guard let zipCode = WeatherSettings.zipCode else { return }
        WeatherService.getWeather(inZipCode: zipCode) {
            [unowned self] (weatherDetails, error) in
            if let error = error {
                self.weatherError.value = error
                return
            }
            guard let details = weatherDetails else {
                return
            }
            self.weatherDetails.value = details
            self.getIconImageData()
        }
    }
    
    private func getIconImageData() {
        guard let details = weatherDetails.value else { return }
        guard let firstWeatherCondition = details.weatherConditions.first else { return }
        let iconId = firstWeatherCondition.icon
        ImageService.getIconImageData(iconId: iconId) {
            [unowned self] (data, error) in
            if let error = error {
                self.imageError.value = error
                return
            }
            guard let data = data else {
                return
            }
            self.imageData.value = data
        }
    }
}
