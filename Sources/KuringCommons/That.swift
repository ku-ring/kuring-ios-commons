//
//  That.swift
//  
//
//  Created by Jaesung Lee on 2022/04/02.
//  Copyright © 2022 Kuring. All rights reserved.
//

/**
 MIT License

 Copyright (c) 2022 Kuring

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

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
