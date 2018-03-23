//
//  NetworkErrors.swift
//  WeatherApp
//
//  Created by Mac on 2/19/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

enum NetworkErrors : Error {
    case badUrl
    case badResponse
    case httpError(code: Int)
    case noData
}
