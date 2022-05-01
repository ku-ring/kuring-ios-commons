//
//  ColorSetTests.swift
//  KuringCommonsTests
//
//  Created by Jaesung Lee on 2022/05/01.
//

import XCTest
import UIKit
@testable import KuringCommons

class ColorSetTests: XCTestCase {
    let expectedGreen = UIColor(red: 61 / 255, green: 189 / 255, blue: 128 / 255, alpha: 1.0)
    let expectedPink = UIColor(red: 228 / 255, green: 91 / 255, blue: 120 / 255, alpha: 1.0)
    
    func test_labelColor() throws {
        XCTAssert(ColorSet.green.isEqualTo(expectedGreen))
        XCTAssert(ColorSet.pink.isEqualTo(expectedPink))
    }

}

extension UIColor {
    func isEqualTo(_ color: UIColor) -> Bool {
        var red1: CGFloat = 0, green1: CGFloat = 0, blue1: CGFloat = 0, alpha1: CGFloat = 0
        getRed(&red1, green:&green1, blue:&blue1, alpha:&alpha1)

        var red2: CGFloat = 0, green2: CGFloat = 0, blue2: CGFloat = 0, alpha2: CGFloat = 0
        color.getRed(&red2, green:&green2, blue:&blue2, alpha:&alpha2)

        return red1 == red2 && green1 == green2 && blue1 == blue2 && alpha1 == alpha2
    }
}
