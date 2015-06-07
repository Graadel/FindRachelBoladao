//
//  Photos.swift
//  FindRachel
//
//  Created by Mayara Gasparini Dias  on 25/05/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class Photos: UIViewController {
    
    var imageName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
             self.view.backgroundColor = UIColor.whiteColor()
        
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .ScaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 400, height: 600)
        view.addSubview(imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
