//
//  Locker.swift
//  FindRachel
//
//  Created by Mayara Gasparini Dias  on 19/05/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class LockerVC: UIViewController {
    
    

    var defaults = NSUserDefaults.standardUserDefaults()
    var code: String!
    var valueString = ""
    @IBOutlet weak var lockLabel: UILabel!
    @IBOutlet weak var passImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Menu.png")!)
        
    
        passImageView.image = UIImage(named: "visor1")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if defaults.integerForKey("LockerIndex") == 0 {
            code = "2010"
        }
        
        if defaults.integerForKey("LockerIndex") == 1 {
            code = "7325"
        }
        
        if defaults.integerForKey("LockerIndex") == 2 {
            code = "1784"
        }
        
        println("atribuiu", defaults.integerForKey("LockerIndex"))
    }
    
    @IBAction func tappedNumber(sender: AnyObject) {
        
        
        
        var num = sender.tag
        //println(num)
        var numAsString = "\(num)"
        //println(numAsString)
        valueString = valueString.stringByAppendingString(numAsString)
        //println(valueString)
        
        
        println(numAsString)
        
        //MUDA IMAGEM E CONFERE SENHA
        if count(valueString) == 1 {
            passImageView.image = UIImage(named: "visor2")
            lockLabel.text = ""

        } else if count(valueString) == 2 {
            passImageView.image = UIImage(named: "visor3")
            //lockLabel.text = valueString
        } else if count(valueString) == 3 {
            passImageView.image = UIImage(named: "visor4")
            //lockLabel.text = valueString
        } else if count(valueString) == 4 && valueString == code {
            valueString = ""
            passImageView.image = UIImage(named: "visor5")
            
            var controller: MainScreenVC = MainScreenVC(nibName:"MainScreen", bundle:nil)
            self.presentViewController(controller, animated: true, completion: nil)
            
        } else {
            println(code)
            valueString = ""
            lockLabel.text = "errado"
            passImageView.image = UIImage(named: "visor1")
        }
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        if defaults.integerForKey("LockerIndex") == 0 {
            defaults.setInteger(1, forKey: "LockerIndex")
            defaults.synchronize()
            
            defaults.setInteger(3, forKey: "GamePhase")
            defaults.synchronize()
            
            println("funcionou", defaults.integerForKey("LockerIndex"))
        } else if defaults.integerForKey("LockerIndex") == 1 {
            defaults.setInteger(2, forKey: "LockerIndex")
            defaults.synchronize()
            
            defaults.setInteger(7, forKey: "GamePhase")
            defaults.synchronize()
            
        } else if defaults.integerForKey("LockerIndex") == 2 {
            defaults.setInteger(10, forKey: "GamePhase")
            defaults.synchronize()
        }
        

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
