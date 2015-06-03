//
//  NotesView.swift
//  FindRachel
//
//  Created by Mayara Gasparini Dias  on 29/05/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class NotesVC: UIViewController {

    @IBAction func backButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

  
    @IBOutlet var noteText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("oi")
        //TESTE:
        
        var labelFrame : CGRect = CGRectMake(20, 20, 280, 150)
        var myLabel : UILabel = UILabel(frame: labelFrame)
        myLabel.backgroundColor = UIColor.orangeColor()
        
        var labelText : String = "OIII"
        
        myLabel.numberOfLines = 0
        myLabel.sizeToFit()
        myLabel.text = labelText
        
        self.view.addSubview(myLabel)
        
        print(self.view.subviews)
        
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
