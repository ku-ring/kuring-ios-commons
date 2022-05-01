//
//  ColorSet.swift
//  
//
//  Created by Jaesung Lee on 2022/05/01.
//

import UIKit

public struct ColorSet {
    public static var green: UIColor { General.green }
    public static var secondaryGreen: UIColor { General.secondaryGreen }
    public static var pink: UIColor { General.pink }
    public static var blue: UIColor { General.blue }
    public static var gray: UIColor { General.gray }
    public static var secondaryGray: UIColor { General.secondaryGray }
    
    public struct General {
        public static let green = UIColor(
            named: "ColorSet.green",
            in: Bundle.commonModule,
            compatibleWith: nil
        ) ?? UIColor.green
        
        public static let secondaryGreen = UIColor(
            named: "ColorSet.secondaryGreen",
            in: Bundle.commonModule,
            compatibleWith: nil
        ) ?? UIColor.green.withAlphaComponent(0.5)
        
        public static let pink = UIColor(
            named: "ColorSet.pink",
            in: Bundle.commonModule,
            compatibleWith: nil
        ) ?? UIColor.systemPink
        
        public static let blue = UIColor(
            named: "ColorSet.blue",
            in: Bundle.commonModule,
            compatibleWith: nil
        ) ?? UIColor.systemBlue
        
        public static let gray = UIColor(
            named: "ColorSet.gray",
            in: Bundle.commonModule,
            compatibleWith: nil
        ) ?? UIColor.gray
        
        public static let secondaryGray = UIColor(
            named: "ColorSet.secondaryGray",
            in: Bundle.commonModule,
            compatibleWith: nil
        ) ?? UIColor.lightGray
    }
    
    public struct Label {
        public static let primary = UIColor(
            named: "ColorSet.Label.primary",
            in: Bundle.commonModule,
            compatibleWith: nil
        ) ?? UIColor.label
        
        public static let secondary = UIColor(
            named: "ColorSet.Label.secondary",
            in: Bundle.commonModule,
            compatibleWith: nil
        ) ?? UIColor.secondaryLabel
        
        public static let tertiary = UIColor(
            named: "ColorSet.Label.tertiary",
            in: Bundle.commonModule,
            compatibleWith: nil
        ) ?? UIColor.tertiaryLabel
        
        public static let green = UIColor(
            named: "ColorSet.Label.green",
            in: Bundle.commonModule,
            compatibleWith: nil
        ) ?? UIColor.green
    }
    
    public struct Background {
        public static let primary = UIColor(
            named: "ColorSet.Background.primary",
            in: Bundle.commonModule,
            compatibleWith: nil
        ) ?? UIColor.secondarySystemGroupedBackground
    }
}

import SwiftUI

extension UIColor {
    public var color: Color {
        Color(uiColor: self)
    }
}
