//
//  Logger.swift
//  
//
//  Created by Jaesung Lee on 2022/04/02.
//

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
    
    /// 로거에 주입할 커스텀 액션이 실행될 큐 입니다. `Logger` 에서 제공되는 기본 로그 메세지는 별도의 큐를 지정하지 않습니다.
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
        let time = Date().formatted(
            date: .complete,
            time: .complete
        )
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
        let time = Date().formatted(
            date: .complete,
            time: .complete
        )
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
