//
//  That.swift
//  
//
//  Created by Jaesung Lee on 2022/04/02.
//

import Foundation

public protocol ThatDefinable {
    
    associatedtype Object
    
    @discardableResult
    func that(_ closure: (_ it: Object) -> Void) -> Object
}

public extension ThatDefinable {
    
    @discardableResult
    func that(_ closure: (_ it: Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

extension NSObject: ThatDefinable { }
