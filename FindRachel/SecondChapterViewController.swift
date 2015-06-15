//
//  SecondChapterViewController.swift
//  FindRachel
//
//  Created by Julia Motta Baitelli on 15/06/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class SecondChapterViewController: UIViewController {
    
    // 1.Criar vars
    
    var label1: UILabel!
    var label2: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // 2.Criar labels
        
        
        label1 = UILabel()
        label1.text = "Chapter Two"
        //label1.font = UIFont.systemFontOfSize(36)
        label1.font = UIFont (name: "Baskerville", size: 30)
        label1.sizeToFit()
        //label1.textAlignment = .Center;
        label1.center = CGPoint(x: self.view.frame.size.width / 2, y: (self.view.frame.size.height / 2) - 50)
        view.addSubview(label1)
        
        label2 = UILabel()
        label2.text = "To be continued"
        label2.font = UIFont (name: "Baskerville", size: 30)
        label2.sizeToFit()
        label2.center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2)
        view.addSubview(label2)
        
        label1.textColor = UIColor.brownColor()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
        
    }
    
    /*
    
    // MARK: - Navigation
    
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    // Get the new view controller using segue.destinationViewController.
    
    // Pass the selected object to the new view controller.
    
    }
    
    */
    
    
    
}