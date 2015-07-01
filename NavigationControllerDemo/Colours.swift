//
//  Colours.swift
//  NavigationControllerDemo
//
//  Created by Ravi Shankar on 30/06/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

enum Colours: String {
    case Blue = "0000FF"
    case Cyan = "00FFFF"
    case Gold = "FFD700"
    case Green = "008000"
    case Khaki = "F0E68C"
    case Orange = "FFA500"
    case Red  = "FF0000"
    case Skyblue = "87CEEB"
    case Tan = "D2B48C"
    case Violet = "EE82EE"
    
    static let allValues = [Blue,Cyan,Gold,Green,Khaki,Orange,Red,Skyblue,Tan,Violet]
    
    func getDisplayName() -> String {
        var displayName = ""
        
        switch (self) {
        case .Blue:
            displayName = "Blue"
        case .Cyan:
            displayName = "Cyan"
        case .Gold:
            displayName = "Gold"
        case .Green:
            displayName = "Green"
        case .Khaki:
            displayName = "Khaki"
        case .Orange:
            displayName = "Orange"
        case .Red:
            displayName = "Red"
        case .Skyblue:
            displayName = "SkyBlue"
        case .Tan:
            displayName = "Tan"
        case .Violet:
            displayName = "Violet"
        }
        return displayName
    }
    
    static func getColours() -> [String] {
        var colours:[String] = []
        
        for colour in Colours.allValues {
            colours.append(colour.getDisplayName())
        }
        return colours
    }
    
    static func getEnumFromSelectedValue(selectedRow: Int) -> Colours{
        
        var selected:Colours?
        
        switch (selectedRow) {
        case Colours.Blue.hashValue:
            selected = .Blue
        case Colours.Cyan.hashValue:
            selected = .Cyan
        case Colours.Gold.hashValue:
             selected = .Gold
        case Colours.Green.hashValue:
               selected = .Green
        case Colours.Khaki.hashValue:
           selected = .Khaki
        case Colours.Orange.hashValue:
            selected = .Orange
        case Colours.Red.hashValue:
           selected = .Red
        case Colours.Skyblue.hashValue:
            selected = .Skyblue
        case Colours.Tan.hashValue:
            selected = .Tan
        case Colours.Violet.hashValue:
            selected = .Violet
        default:
            break
        }
        
        return selected!
    }
    
    // Credit below function to http://www.anthonydamota.me/blog/en/use-a-hex-color-code-with-uicolor-on-swift/
    
    static func getUIColorFromHex(colorCode: String, alpha: Float = 1.0) -> UIColor{
        var scanner = NSScanner(string:colorCode)
        var color:UInt32 = 0;
        scanner.scanHexInt(&color)
        
        let mask = 0x000000FF
        let r = CGFloat(Float(Int(color >> 16) & mask)/255.0)
        let g = CGFloat(Float(Int(color >> 8) & mask)/255.0)
        let b = CGFloat(Float(Int(color) & mask)/255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
}