//
//  CurrentLocationViewModel.swift
//  WeatherApp
//
//  Created by Mac on 2/18/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation
import CoreLocation

class CurrentLocationViewModel : NSObject {
    let title: String
    let zipCode: Dynamic<String>
    let location: Dynamic<String>
    
    let locationManager = CLLocationManager()
    
    override init() {
        title = "Current Location"
        zipCode = Dynamic(WeatherSettings.zipCode ?? "Unknown")
        location = Dynamic(WeatherSettings.locationName ?? "Unknown")
        super.init()
        locationManager.delegate = self
    }
    
    func enableLocationServices() {
        let status = CLLocationManager.authorizationStatus()
        if status != .authorizedWhenInUse {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func getLocation() {
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
            GlobalFunctions.delay(for: 5) {
                [unowned self] in
                self.locationManager.stopUpdatingLocation()
            }
        }
    }
}

extension CurrentLocationViewModel : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else {
            return
        }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(currentLocation) {
            (placemarks, error) in
            guard error == nil else {
                print("Error")
                return
            }
            
            guard let placemarks = placemarks else {
                return
            }
            
            guard let pm = placemarks.first,
                let zipCode = pm.postalCode,
                let city = pm.locality,
                let state = pm.administrativeArea else { return }
            WeatherSettings.zipCode = zipCode
            WeatherSettings.locationName = "\(city), \(state)"
            self.zipCode.value = zipCode
            self.location.value = "\(city), \(state)"
        }
    }
}
