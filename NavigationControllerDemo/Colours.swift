//
//  Colours.swift
//  NavigationControllerDemo
//
//  Created by Ravi Shankar on 30/06/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

enum Colour: String, CaseIterable {
    case blue = "0000FF"
    case cyan = "00FFFF"
    case gold = "FFD700"
    case green = "008000"
    case khaki = "F0E68C"
    case orange = "FFA500"
    case red = "FF0000"
    case skyBlue = "87CEEB"
    case tan = "D2B48C"
    case violet = "EE82EE"

    var displayName: String {
         switch self {
         case .skyBlue: return "Sky Blue"
         default: return String(describing: self).capitalized
         }
     }

    static var displayNames: [String] {
        allCases.map { $0.displayName }
    }

    static func colour(at index: Int) -> Colour? {
        guard index >= 0, index < allCases.count else { return nil }
        return Array(allCases)[index]
    }

    func uiColor(alpha: CGFloat = 1.0) -> UIColor {
        UIColor(hex: rawValue, alpha: alpha)
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let scanner = Scanner(string: hex)
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        let mask = 0x000000FF
        let r = CGFloat(Int(color >> 16) & mask) / 255.0
        let g = CGFloat(Int(color >> 8) & mask) / 255.0
        let b = CGFloat(Int(color) & mask) / 255.0

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
