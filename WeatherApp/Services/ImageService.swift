//
//  ImageService.swift
//  WeatherApp
//
//  Created by Mac on 2/19/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

class ImageService {
    class func getIconImageData(iconId: String, completion: @escaping (Data?, Error?) -> ()) {
        let urlAsString = Constants.kWeatherIconBaseUrl + iconId + Constants.kWeatherIconUrlEnd
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
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, NetworkErrors.badResponse)
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(nil, NetworkErrors.httpError(code: httpResponse.statusCode))
                return
            }
            
            guard let data = data else {
                completion(nil, NetworkErrors.noData)
                return
            }
            completion(data, nil)
        }
        task.resume()
    }
}
