//
//  ViewController.swift
//  SHSwiftExtension
//
//  Created by Hayden on 16/5/25.
//  Copyright © 2016 Haifei.Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let view = UIView(frame: CGRectMake(10, 100, 100, 100))
//        self.view.addSubview(view)
//        view.backgroundColor = UIColor.redColor()
//        view.tag = 121
//        
//        let subview = UILabel(frame: CGRectMake(0,0,20,20))
//        subview.backgroundColor = UIColor.yellowColor()
//        subview.tag = 333
//        view.addSubview(subview)
//        
//        let subview1 = UIButton(frame: CGRectMake(20,0,20,20))
//        subview1.backgroundColor = UIColor.blueColor()
//        subview1.tag = 333
//        view.addSubview(subview1)
//        
//        let subview2 = UILabel(frame: CGRectMake(40,0,20,20))
//        subview2.backgroundColor = UIColor.orangeColor()
//        subview2.tag = 333
//        view.addSubview(subview2)
//        
//        let subview3 = UILabel(frame: CGRectMake(0,0,10,20))
//        subview3.backgroundColor = UIColor.grayColor()
//        subview3.tag = 333
//        subview.addSubview(subview3)
//        
//        view.removeSubviewByClass(UILabel)
//        
//        view.printHierarchy()
        
        let string: String = "http://sdfsdf:012/"
        print(string.isUrl)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
       
//        print(self.view.hierarchy)
    }
}

