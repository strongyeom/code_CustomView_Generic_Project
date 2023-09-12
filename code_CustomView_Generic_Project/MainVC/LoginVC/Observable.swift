//
//  Observable.swift
//  code_CustomView_Generic_Project
//
//  Created by 염성필 on 2023/09/12.
//

import Foundation

class Observable<T> {
    var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ completionHandler: @escaping (T) -> Void) {
        print("Observable - bind")
        completionHandler(value)
        listener = completionHandler
    }
    
}
