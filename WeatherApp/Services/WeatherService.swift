//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Mac on 2/19/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

class WeatherService {
    class func getWeather(inZipCode zipCode: String, completion: @escaping (WeatherDetails?, Error?) -> ()) {
        let urlAsString = Constants.kWeatherApiUrlBeforeZipCode + zipCode + Constants.kWeatherApiUrlAfterZipCode
        guard let url = URL(string: urlAsString) else {
            completion(nil, NetworkErrors.badUrl)
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) {
            (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(nil, NetworkErrors.badResponse)
                return
            }
            
            guard response.statusCode == 200 else {
                completion(nil, NetworkErrors.httpError(code: response.statusCode))
                return
            }
            
            guard let data = data else {
                completion(nil, NetworkErrors.noData)
                return
            }
            
            do {
                let weatherDetails = try JSONDecoder().decode(WeatherDetails.self, from: data)
                completion(weatherDetails, nil)
            }
            catch let error {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
