//
//  GlobalFunctions.swift
//  WeatherApp
//
//  Created by Mac on 2/19/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

class GlobalFunctions {
    static func delay(for seconds: Double, closure: @escaping () -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + seconds) {
            closure()
        }
    }
}
