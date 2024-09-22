//
//  Colours.swift
//  NavigationControllerDemo
//
//  Created by Ravi Shankar on 30/06/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

enum CustomColour: String, CaseIterable {
    case blue, cyan, green, orange, red, yellow, purple, gray

    var displayName: String {
        rawValue.capitalized
    }
    
    var uiColor: UIColor {
        switch self {
        case .blue: return .blue
        case .cyan: return .cyan
        case .green: return .green
        case .orange: return .orange
        case .red: return .red
        case .yellow: return .yellow
        case .purple: return .purple
        case .gray: return .gray
        }
    }

    static func colour(at index: Int) -> CustomColour? {
        guard index >= 0, index < allCases.count else { return nil }
        return allCases[index]
    }
}

