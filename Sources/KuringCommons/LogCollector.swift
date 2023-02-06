//
//  LogCollector.swift
//  
//
//  Created by Jaesung Lee on 2023/02/06.
//

/**
 MIT License

 Copyright (c) 2023 Kuring

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

/// ``Log``를 수집합니다.
public class LogCollector: ObservableObject {
    /// ``Log`` 를 수집하기 위한 규칙입니다.
    public enum CollectingRule: Hashable {
        /// 프로젝트의 Build configuration 에 상관없이 로그를 저장합니다.
        case none
        /// 프로젝트의 Build configuration 이 `debug` 일 때만 로그를 저장합니다.
        case development
        /// 프로젝트의 Build configuration 이 `Release` 일 때만 로그를 저장합니다.
        case production
    }
    /// 가장 기본적인 ``LogCollector`` 객체 입니다. 프로젝트의 Build configuration 상관없이 **모든** 로그를 수집합니다.
    public static let main = LogCollector(
        id: "com.kuring.commons",
        collectingRule: .none
    )
    /// 고유식별자.
    public let id: String
    /// ``Log`` 를 수집하기 위한 규칙입니다.
    public let collectingRule: CollectingRule
    
    public init(id: String, collectingRule: CollectingRule) {
        self.id = id
        self.collectingRule = collectingRule
    }
    
    /// 수집된 ``Log`` 객체들입니다.
    @Published
    public var logs: [Log] = []
}
