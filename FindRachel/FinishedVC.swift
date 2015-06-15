//
//  FinishedVC.swift
//  FindRachel
//
//  Created by Carol Grädel on 5/29/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class FinishedVC: UIViewController {
    
    // 1.Criar vars
    
    var label1: UILabel!
    var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        var width = view.frame.width
        var heigth = view.frame.height
        
        view.backgroundColor = UIColor.blackColor()
        
        label1 = UILabel(frame: CGRectMake(0, 0, width, width*0.2))
        label1.center.y = view.center.y
        label1.textAlignment = .Center;
        label1.text = "Chapter Two"
        label1.font = UIFont (name: "Baskerville", size: 30)
        label1.textColor = UIColor.whiteColor()
        
        label2 = UILabel(frame: CGRectMake(0, label1.frame.height + label1.frame.origin.y, width, width*0.1))
        label2.text = "To be continued..."
        label2.font = UIFont (name: "Baskerville", size: 30)
        label2.textAlignment = .Center;
        label2.textColor = UIColor.whiteColor()

        view.addSubview(label1)
        view.addSubview(label2)
    }
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
        
    }

}