//
//  Locker.swift
//  FindRachel
//
//  Created by Mayara Gasparini Dias  on 19/05/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit
import SpriteKit

class LockerVC : UIViewController {
    
    var defaults = NSUserDefaults.standardUserDefaults()
    var code: String!

    var valueString = ""
    @IBOutlet weak var lockLabel: UILabel!
    @IBOutlet weak var passImageView: UIImageView!

    @IBAction func zeroButton(sender: AnyObject) {
        
        var controller: MainScreenVC = MainScreenVC(nibName:"MainScreen", bundle:NSBundle.mainBundle())
        
        self.presentViewController(controller, animated: true, completion: nil)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if defaults.integerForKey("LockerIndex") == 0 {
            code = "1234"
        }
        
        if defaults.integerForKey("LockerIndex") == 1 {
            code = "1111"
        }
        
        if defaults.integerForKey("LockerIndex") == 2 {
            code = "2222"
        }
        
        println(defaults.integerForKey("GamePhase").description)
        passImageView.image = UIImage(named: "0")
        // Do any additional setup after loading the view.
    }

    
    @IBAction func tappedNumber(sender: AnyObject) {
        
        var num = sender.tag
        //println(num)
        var numAsString = "\(num)"
        //println(numAsString)
        valueString = valueString.stringByAppendingString(numAsString)
        //println(valueString)
        
        //MUDA IMAGEM E CONFERE SENHA
        if count(valueString) == 1 {
            passImageView.image = UIImage(named: "1")
            lockLabel.text = ""
        } else if count(valueString) == 2 {
            passImageView.image = UIImage(named: "2")
            //lockLabel.text = valueString
        } else if count(valueString) == 3 {
            passImageView.image = UIImage(named: "3")
            //lockLabel.text = valueString
        } else if count(valueString) == 4 && valueString == code
        {
            valueString = ""
            passImageView.image = UIImage(named: "4")
            //lockLabel.text = "arrasou"
            //performSegueWithIdentifier("correct", sender: nil)
            var controller: MessagesVC = MessagesVC(nibName:"Messages", bundle:NSBundle.mainBundle())
            self.presentViewController(controller, animated: true, completion: nil)
            
        } else if count(valueString) == 4 {
            valueString = ""
            lockLabel.text = "errado"
            passImageView.image = UIImage(named: "0")
        }
    
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
