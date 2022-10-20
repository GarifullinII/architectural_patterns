//
//  Box.swift
//  architectural_patterns
//
//  Created by Ildar Garifullin on 20/10/2022.
//

class Box<T> {
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        
        listener(value)
    }
}
