//
//  SHStringExtension.swift
//  SHSwiftExtension
//
//  Created by Hayden on 16/5/26.
//  Copyright © 2016年 Haifei.Wang. All rights reserved.
//

import Foundation

extension String {
    var length: Int {
        return self.characters.count
    }
    
    func match(pattern: String) -> Bool {
        var isMatch = false
        do {
            let regObj = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
            isMatch = regObj.matchesInString(self, options: .ReportProgress, range: NSMakeRange(0, self.length)).count > 0
        } catch {
            
        }
        return isMatch
    }
}

extension String {
    
    var isEmail: Bool {
        return self.match("^\\w+@\\w+(\\.[a-zA-Z]+){1,2}")
    }
    
    var isInt: Bool {
        return self.match("^(+|-){0:1}[0-9]+")
    }
    
    var isNumber: Bool {
        return self.match("^(+|-){0:1}[0-9]+(\\.[0-9]+)*$")
    }
    
    var isUrl: Bool {
        return self.match("^(http|ftp|https)://\\w+(:[1-9]+[0-9]*){0,1}(/|(/\\w+))*$")
    }
}