//
//  Logger.swift
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

/// 로그를 위한 클래스 입니다.
public class Logger {
    /// 로거를 활성화시킬 모드입니다.
    public enum RunMode: Int, Hashable {
        /// 프로젝트의 Build configuration 이 `debug` 일 때 로거를 활성화합니다.
        case development
        /// 프로젝트이 Build configuration 이 `Release` 일 때 로거를 활성화합니다.
        case production
    }
    
    /// 로거에 주입할 커스텀 액션이 실행될 큐 입니다. ``Logger`` 에서 제공되는 기본 로그 메세지는 별도의 큐를 지정하지 않습니다.
    /// ```swift
    /// Logger.queue.async {
    ///     print("로거에서 커스텀 액션을 실행시키는 큐입니다.")
    /// }
    /// ```
    public static var queue: DispatchQueue = DispatchQueue(label: "com.kuring.commons.logger.queue")
    
    /// 사용할 `RunMode` 케이스를 1개 이상 지정할 수 있습니다. 기본 값은 `[.devlopment]` 입니다.
    /// ```swift
    /// Logger.printableModes = [.development, .production]
    /// ```
    public static var printableModes: [RunMode] = [.development]
    
    /// `log` 와 함께 일반 로그 메세지를 출력하고 `action` 을 실행합니다.
    /// ```swift
    /// Logger.debug("Hi") {
    ///     // 파이어베이스, 앱스플라이어 등의 추가적인 로거를 사용할 수 있습니다.
    /// }
    /// // 출력결과
    /// // [com.kuring.service] [2022년 5월 4일 수요일 오후 11:23:00 GMT+9]
    /// // ✅ Hi
    /// ```
    public static func debug(_ log: Any?, action: (() -> Void)? = nil) {
        let time: String
        if #available(iOS 15.0, *) {
            time = Date().formatted(
                date: .complete,
                time: .complete
            )
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd-EE hh:mm a"
            time = dateFormatter.string(from: Date())
        }
#if DEBUG
        guard Logger.printableModes.contains(.development) else { return }
        print("[com.kuring.service] [\(time)]\n✅ \(String(describing: log))")
#else
        Logger.queue.async {
            action?()
        }
        guard Logger.printableModes.contains(.production) else { return }
        print("[com.kuring.service] [\(time)]\n✅ \(String(describing: log))")
#endif  
        LoggerCore.shared.logs.append(Log(time: "[\(time)]",
                                          message: "✅ \(String(describing: log))"))
    }
    
    /// `log` 와 함께 에러메세지를 출력하고 `action` 을 실행합니다.
    /// ```swift
    /// Logger.error("Hi") {
    ///     // 파이어베이스, 앱스플라이어 등의 추가적인 로거를 사용할 수 있습니다.
    /// }
    /// // 출력결과
    /// // [com.kuring.service] [2022년 5월 4일 수요일 오후 11:23:00 GMT+9]
    /// // 🚨 Hi
    /// ```
    public static func error(_ log: String, action: (() -> Void)? = nil) {
        let time: String
        if #available(iOS 15.0, *) {
            time = Date().formatted(
                date: .complete,
                time: .complete
            )
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd-EE hh:mm a"
            time = dateFormatter.string(from: Date())
        }
#if DEBUG
        guard Logger.printableModes.contains(.development) else { return }
        print("[com.kuring.service] [\(time)]\n🚨 \(log)")
#else
        Logger.queue.async {
            action?()
        }
        guard Logger.printableModes.contains(.production) else { return }
        print("[com.kuring.service] [\(time)]\n🚨 \(log))")
#endif
        
        LoggerCore.shared.logs.append(Log(time: "[\(time)]",
                                          message: "🚨 \(log)"))
    }
    
    /// 에러가 존재할 때만 로그를 프린트하고 `action` 을 실행합니다..
    /// ```swift
    /// someCompletionHandlerWithError { error in
    ///     defer { Logger.error(error) }
    ///     if let error = error { return }
    /// }
    /// ```
    public static func error(_ error: Error?, action: (() -> Void)? = nil) {
        guard let error = error else { return }
        self.error(error.localizedDescription, action: action)
    }
}

struct Log: Hashable {
    let publisher: String = "[com.kuring.service]"
    var time: String
    var message: String
}

public class LoggerCore {
    public static let shared = LoggerCore()
    
    @Published var logs: [Log] = []
}
