//
//  NetHelper.swift
//  One
//
//  Created by Hu on 16/9/1.
//  Copyright © 2016年 redye. All rights reserved.
//

import Foundation

func GET(URLString: String, parameters: [String: AnyObject]?, completionHandler: (json: [String: AnyObject]?, error: NSError?) -> Void) {
    Manager.sharedInstance.request(.GET, URLString, parameters: parameters, encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response: Response<AnyObject, NSError>) in
        if let json = response.result.value {
            completionHandler(json: json as? [String: AnyObject], error: nil)
        } else {
            completionHandler(json: nil, error: response.result.error)
        }
    }
}
