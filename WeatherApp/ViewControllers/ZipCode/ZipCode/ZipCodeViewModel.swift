//
//  ZipCodeViewModel.swift
//  WeatherApp
//
//  Created by Mac on 2/19/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation
import CoreLocation

class ZipCodeViewModel {
    let title: String
    var zipCode = Dynamic<String>(nil)
    var location = Dynamic<String>(nil)
    
    init() {
        title = "Enter a Zip Code"
    }
    
    func verifyZipCode(_ zipCode: String?) {
        guard let zipCode = zipCode else {
            print("Textbox cannot be empty")
            return
        }
        guard zipCode.count == 5 else {
            print("Zip code must contain 5 numbers")
            return
        }
        self.getLocationForZipCode(zipCode) {
            [unowned self] (location, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let location = location else {
                print("Unknown error")
                return
            }
            self.zipCode.value = zipCode
            self.location.value = location
            WeatherSettings.zipCode = zipCode
            WeatherSettings.locationName = location
        }
    }
    
    private func getLocationForZipCode(_ zipCode: String, completion: @escaping (String?, Error?) -> ()) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(zipCode + "US") {
            (placemarks, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let placemark = placemarks?.first else { return }
            guard let city = placemark.locality,
                let state = placemark.administrativeArea else { return }
            let location = "\(city), \(state)"
            completion(location, nil)
        }
    }
}
