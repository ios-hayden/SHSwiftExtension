//
//  SHUIViewExtension.swift
//  SHSwiftExtension
//
//  Created by Hayden on 16/5/25.
//  Copyright © 2016年 Haifei.Wang. All rights reserved.
//

import UIKit

//MARK: - Frame
extension UIView {
    var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame = CGRectMake(newValue, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
        }
    }
    
    var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame = CGRectMake(self.frame.origin.x, newValue, self.frame.size.width, self.frame.size.height)
        }
    }
    
    var right: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set {
            self.frame = CGRectMake(newValue - self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
        }
    }
    
    var bottom: CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        set {
            self.frame = CGRectMake(self.frame.origin.x, newValue - self.frame.size.height, self.frame.size.width, self.frame.size.height)
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newValue, self.frame.size.height)
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, newValue)
        }
    }
    
    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center = CGPointMake(newValue, self.center.y)
        }
    }
    
    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center = CGPointMake(self.center.x, newValue)
        }
    }
    
    var boundsCenter: CGPoint {
        get {
            return CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        }
        set {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newValue.x*2, newValue.y*2)
        }
    }
    
    var boundsCenterX: CGFloat {
        get {
            return self.frame.size.width/2
        }
        set {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newValue*2, self.frame.size.height)
        }
    }
    
    var boundsCenterY: CGFloat {
        get {
            return self.frame.size.height/2
        }
        set {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, newValue*2)
        }
    }
}

//MARK: - Utils
extension UIView {
    
    var hierarchy: [[String:AnyObject]] {
        return UIView.hierarchyOfView(self)
    }
    
    //MARK: Instance Methods
    func remvoeAllSubviews() -> Void {
        if self.subviews.count > 0 {
            let subviewArray = Array<UIView>(self.subviews)
            for subview in subviewArray {
                subview.removeFromSuperview()
            }
        }
    }
    
    func removeSubview(subviews: UIView...) -> Void {
        if self.subviews.count == 0 {
            return
        }
        
        for subview in subviews {
            if subview.superview == self {
                subview .removeFromSuperview()
            }
        }
    }
    
    func removeSubviewByClass(subviewClasse: AnyClass) -> Void {
        if self.subviews.count == 0 {
            return
        }
        
        let subviewArray = Array<UIView>(self.subviews)
        for subview in subviewArray {
            if subview.isKindOfClass(subviewClasse) {
                subview.removeFromSuperview()
            }
        }
    }
    
    func hasSubview(subview: UIView) -> Bool {
        return subview.superview == self
    }
    
    func subviewsForClasses(classes: AnyClass...) -> [UIView] {
        var subviewArray:[UIView] = [UIView]()
        
        for subview in self.subviews {
            for objClass in classes {
                if subview.isKindOfClass(objClass) {
                    subviewArray.append(subview)
                }
            }
        }
        
        return subviewArray
    }
    
    func printHierarchy() -> Void {
        var stringHierarchy = String(self.dynamicType)
        stringHierarchy += self.stringOfHierarchy("", hierarchy: self.hierarchy)
        print(stringHierarchy)
    }
    
    //MARK: Static Methods
    static func hierarchyOfView(view: UIView) -> [[String:AnyObject]] {
        var arrHierarchy = [[String:AnyObject]]()
        for subview in view.subviews {
            var dicContent = [String:AnyObject]()
            dicContent["class"] = String(subview.dynamicType)
            dicContent["rect"] = String(subview.frame)
            dicContent["tag"] = String(subview.tag)
            let arrSubviews = self.hierarchyOfView(subview)
            if arrSubviews.count > 0 {
                dicContent["subviews"] = arrSubviews
            }
            arrHierarchy.append(dicContent)
        }
        return arrHierarchy
    }
    
    //MARK: Private Methods
    private func stringOfHierarchy(prefix: String, hierarchy: [[String:AnyObject]]) -> String {
        var line = ""
        let count = hierarchy.count
        var index = 0
        for viewHierarchy in hierarchy {
            line += ("\n" + prefix + "|\n")
            line += (prefix + "|__" + "{ \(viewHierarchy["class"]!) => [tag:\(viewHierarchy["tag"]!), rect:\(viewHierarchy["rect"]!)] }")
            
            let obj: AnyObject? = viewHierarchy["subviews"]
            if  obj != nil {
                let subHierarchy: [[String:AnyObject]] = obj as! [[String:AnyObject]]
                let newPrefix = index == count-1 ? (prefix+"   ") : (prefix + "|  ")
                line += self.stringOfHierarchy(newPrefix, hierarchy: subHierarchy)
            }
            index += 1
        }
        return line
    }
    
    
}
