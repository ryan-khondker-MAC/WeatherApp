//
//  GlobalCache.swift
//  WeatherApp
//
//  Created by Mac on 2/18/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class GlobalCache {
    static let shared = GlobalCache()
    var imageCache = NSCache<NSString, UIImage>()
}
