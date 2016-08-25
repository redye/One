//
//  UIColor(Extensions).swift
//  One
//
//  Created by Hu on 16/8/24.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

extension UIColor {
    
    public class func colorWithHexString(hexString: String) -> UIColor {
        return UIColor.redColor()
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
        
        let length = hex.characters.count
        
        if length != 3 && length != 4 && length != 6 && length != 8 {
            return false
        }
        if length < 5 {
            
            hex = "".stringByAppendingFormat("%@%@%@%@%@%@",
                                             hex.substringWithRange(hex.startIndex.advancedBy(0) ..< hex.startIndex.advancedBy(1)),
                                             hex.substringWithRange(hex.startIndex.advancedBy(0) ..< hex.startIndex.advancedBy(1)),
                                             hex.substringWithRange(hex.startIndex.advancedBy(1) ..< hex.startIndex.advancedBy(2)),
                                             hex.substringWithRange(hex.startIndex.advancedBy(1) ..< hex.startIndex.advancedBy(2)),
                                             hex.substringWithRange(hex.startIndex.advancedBy(2) ..< hex.startIndex.advancedBy(3)),
                                             hex.substringWithRange(hex.startIndex.advancedBy(2) ..< hex.startIndex.advancedBy(3)))
            if length == 4 {
                hex = hex.stringByAppendingFormat("%@%@",
                                                  hex.substringWithRange(hex.startIndex.advancedBy(3) ..< hex.startIndex.advancedBy(4)),
                                                  hex.substringWithRange(hex.startIndex.advancedBy(3) ..< hex.startIndex.advancedBy(4)))
            } else {
                hex = hex.stringByAppendingString("FF")
            }
        } else {
            hex = "".stringByAppendingFormat("%@%@%@%@%@%@",
                                             hex.substringWithRange(hex.startIndex.advancedBy(0) ..< hex.startIndex.advancedBy(1)),
                                             hex.substringWithRange(hex.startIndex.advancedBy(1) ..< hex.startIndex.advancedBy(2)),
                                             hex.substringWithRange(hex.startIndex.advancedBy(2) ..< hex.startIndex.advancedBy(3)),
                                             hex.substringWithRange(hex.startIndex.advancedBy(3) ..< hex.startIndex.advancedBy(4)),
                                             hex.substringWithRange(hex.startIndex.advancedBy(4) ..< hex.startIndex.advancedBy(5)),
                                             hex.substringWithRange(hex.startIndex.advancedBy(5) ..< hex.startIndex.advancedBy(6)))
            if length == 4 {
                hex = hex.stringByAppendingFormat("%@%@",
                                                  hex.substringWithRange(hex.startIndex.advancedBy(6) ..< hex.startIndex.advancedBy(7)),
                                                  hex.substringWithRange(hex.startIndex.advancedBy(7) ..< hex.startIndex.advancedBy(8)))
            } else {
                hex = hex.stringByAppendingString("FF")
            }
        }
        
        
        return true
    }

}
