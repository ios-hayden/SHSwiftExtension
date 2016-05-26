//
//  SHUIWindowExternsion.swift
//  SHSwiftExtension
//
//  Created by Hayden on 16/5/26.
//  Copyright © 2016年 Haifei.Wang. All rights reserved.
//

import UIKit

extension UIWindow {
    var visibleViewController : UIViewController? {
        return UIWindow.fetchVisibleViewControllerFrom(self.rootViewController)
    }
    
    private static func fetchVisibleViewControllerFrom(controller: UIViewController?) -> UIViewController? {
        if controller == nil {
            return nil
        }
        
        if controller!.isKindOfClass(UINavigationController) {
            let newController = controller as! UINavigationController
            return UIWindow.fetchVisibleViewControllerFrom(newController.visibleViewController)
        }else if controller!.isKindOfClass(UITabBarController) {
            let newController = controller as! UITabBarController
            return UIWindow.fetchVisibleViewControllerFrom(newController.selectedViewController)
        } else {
            if controller?.presentedViewController != nil {
                return UIWindow.fetchVisibleViewControllerFrom(controller?.presentedViewController)
            }else{
                return controller
            }
        }
    }
}
