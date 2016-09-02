//
//  UIColor(Extensions).swift
//  One
//
//  Created by Hu on 16/8/24.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

extension UIColor {
    
    public class func colorWithHexString(hexString: String) -> UIColor? {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        if (self.hexToRGBA(hexString, r: &r, g: &g, b: &b , a: &a)) {
            return UIColor.colorWithRGBA(r: r, g: g, b: b, a: a)
        }
        return nil
    }
    
    public class func colorWithRGB(r r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
    
    public class func colorWithRGBA(r r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
}

extension UIColor {
    private class func hexToRGBA(str: String, inout r: CGFloat, inout g: CGFloat, inout b: CGFloat, inout a: CGFloat) -> Bool {
        var hex = str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        if hex.hasPrefix("#") {
            hex = hex.substringFromIndex(hex.startIndex.advancedBy(1))
        } else if hex.hasPrefix("0X") {
            hex = hex.substringFromIndex(hex.startIndex.advancedBy(2))
        }
        
        var length = hex.characters.count
        
        if length != 3 && length != 4 && length != 6 && length != 8 {
            return false
        }
        if length < 5 {
            let red = hex.substringWithRange(hex.startIndex.advancedBy(0) ..< hex.startIndex.advancedBy(1))
            let greed = hex.substringWithRange(hex.startIndex.advancedBy(1) ..< hex.startIndex.advancedBy(2))
            let blue = hex.substringWithRange(hex.startIndex.advancedBy(2) ..< hex.startIndex.advancedBy(3))
            var alpha: String = ""
            if length == 4 {
                alpha = hex.substringWithRange(hex.startIndex.advancedBy(3) ..< hex.startIndex.advancedBy(4))
            }
            hex = "".stringByAppendingFormat("%@%@%@%@%@%@%@%@", red, red, greed, greed, blue, blue, alpha, alpha)
        }
        length = hex.characters.count
        if length < 8 {
            hex = hex.stringByAppendingString("FF")
        }
        
        var result: UInt32 = 0
        let isSuccess = NSScanner(string: hex).scanHexInt(&result)
        guard isSuccess else { return false }
        r = CGFloat((result >> 24) & 0xFF)
        g = CGFloat((result >> 16) & 0xFF)
        b = CGFloat((result >> 8) & 0xFF)
        a = CGFloat((result >> 0) & 0xFF)
        
        return true
    }

}
