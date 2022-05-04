//
//  That.swift
//  
//
//  Created by Jaesung Lee on 2022/04/02.
//

import Foundation

/// 선언형 프로그래밍을 위한 프로토콜 입니다.
public protocol ThatDefinable {
    /// 선언형 프로그래밍을 적용할 객체 타입입니다.
    associatedtype Object
    
    /// 선언형 프로그래밍을 위한 기본 함수입니다.
    /// ```swift
    /// UIView().that { it in
    ///     it.text = "쿠링쿠링"
    ///     it.textColor = ColorSet.Label.primary
    /// }
    /// ```
    /// - Parameter closure: `Object` 타입을 파라미터 타입으로 하는 코드 블럭입니다.
    /// - Returns `Object` 타입 객체를 리턴합니다.
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
