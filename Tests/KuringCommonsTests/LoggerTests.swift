//
//  LoggerTests.swift
//  KuringCommonsTests
//
//  Created by Jaesung Lee on 2022/05/01.
//

import XCTest
@testable import KuringCommons

class LoggerTests: XCTestCase {
    let expectedGreen = UIColor(red: 61 / 255, green: 189 / 255, blue: 128 / 255, alpha: 1.0)
    let expectedPink = UIColor(red: 228 / 255, green: 91 / 255, blue: 120 / 255, alpha: 1.0)
    
    /// `LogCollector.main` 은 `Logger.printableModes` 와 상관없이 **모든 로그를 저장**해야합니다.
    /// **기대결과**: 이 테스트는 `LogCollector.main`  에 로그가 저장되어야 합니다.
    func test_logCollector() throws {
        let message = UUID().uuidString
        Logger.debug(message)
        let collectedLogs = LogCollector.main.logs
        let targetLog = collectedLogs.first { $0.message.contains(message) }
        XCTAssert(targetLog != nil, "현재 저장된 로그는 \(collectedLogs.compactMap { $0.message }) 이고 확인하려는 로그는 \(message) 입니다")
    }

    /// `LogCollector.main` 은 `Logger.printableModes` 와 상관없이 **모든 로그를 저장**해야합니다.
    /// `collectorForProd` 은 `Logger.printableModes` 가 `.production` 을 포함할때만 **로그를 저장**해야합니다.
    /// `collectorForDev` 은 `Logger.printableModes` 가 `.development` 을 포함할때만 **로그를 저장**해야합니다.
    /// **기대결과**: 이 테스트는 `.development` 에서 테스트 하므로 `LogCollector.main` 와 `collectorForDev` 에만 로그가 저장되어야 합니다.
    func test_customLogCollector() throws {
        let prodID = UUID().uuidString
        let devID = UUID().uuidString
        let collectorForProd = LogCollector(id: prodID, collectingRule: .production)
        let collectorForDev = LogCollector(id: devID, collectingRule: .development)

        Logger.collectors = [
            prodID: collectorForProd,
            devID: collectorForDev
        ]
        Logger.printableModes = [.development]
        
        let message = UUID().uuidString
        Logger.debug(message, collectorIDs: [prodID, devID])
        let collectedLogs1 = LogCollector.main.logs
        let collectedLogs2 = collectorForProd.logs // Prod
        let collectedLogs3 = collectorForDev.logs // Dev
        
        let targetLog1 = collectedLogs1.first { $0.message.contains(message) }
        let targetLog2 = collectedLogs2.first { $0.message.contains(message) } // Prod
        let targetLog3 = collectedLogs3.first { $0.message.contains(message) } // Dev
        
        XCTAssertNotNil(targetLog1, "현재 저장된 로그는 \(collectedLogs1.compactMap { $0.message }) 이고 확인하려는 로그는 \(message) 입니다")
        XCTAssertNil(targetLog2, "현재 저장된 로그는 \(collectedLogs2.compactMap { $0.message }) 이고 확인하려는 로그는 \(message) 입니다")
        XCTAssertNotNil(targetLog3, "현재 저장된 로그는 \(collectedLogs3.compactMap { $0.message }) 이고 확인하려는 로그는 \(message) 입니다")
    }
}
