
//
//  UIFont(Extentsion).swift
//  One
//
//  Created by Hu on 16/9/2.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

extension UIFont {
    public class  func systemFontOfSize(size size: CGFloat, scale: CGFloat) -> UIFont {
        return UIFont.systemFontOfSize(size * scale)
    }
    
    public class func systemFontOfScaleSize(size size: CGFloat) -> UIFont {
        let scale: CGFloat = UIScreen.mainScreen().bounds.size.width / kDesignWidth
        return UIFont.systemFontOfSize(size: size, scale: scale)
    }
}