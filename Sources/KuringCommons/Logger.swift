//
//  Logger.swift
//  
//
//  Created by Jaesung Lee on 2022/04/02.
//

import Foundation

public class Logger {
    public enum RunMode: Int, Hashable {
        case development
        case production
    }
    
    public static var queue: DispatchQueue = DispatchQueue(label: "com.kuring.commons.logger.queue")
    
    public static var printableModes: [RunMode] = [.development]
    
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
    
    public static func error(_ log: String, action: (() -> Void)? = nil) {
        let time = Date().formatted(
            date: .complete,
            time: .complete
        )
#if DEBUG
        guard Logger.printableModes.contains(.development) else { return }
        print("[com.kuring.service] [\(time)]\n🚨 \(log))")
#else
        Logger.queue.async {
            action?()
        }
        guard Logger.printableModes.contains(.production) else { return }
        print("[com.kuring.service] [\(time)]\n🚨 \(log))")
#endif
    }
}
