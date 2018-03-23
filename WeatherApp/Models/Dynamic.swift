//
//  Dynamic.swift
//  WeatherApp
//
//  Created by Mac on 2/18/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

infix operator &=: AssignmentPrecedence

class Dynamic<T> {
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    var value: T? {
        didSet {
            guard let value = value else { return }
            listener?(value)
        }
    }
    
    init(_ v: T?) {
        value = v
    }
    
    static func &= (left: inout Dynamic<T>, right: T?) {
        left.value = right
    }
}
