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
    var imageViewLocker: UIImageView!
    var code: String!
    var valueString = ""
    var imageView: UIImageView!
    @IBOutlet weak var lockLabel: UILabel!
    @IBOutlet weak var passImageView: UIImageView!
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    
    @IBOutlet weak var buttonEight: UIButton!

    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var buttonZero: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named:"menublur.png"))
        
            imageView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            
            view.addSubview(imageView)
            view.addSubview(lockLabel)
            view.addSubview(passImageView)
        view.addSubview(buttonOne)
        view.addSubview(buttonTwo)
        view.addSubview(buttonThree)
        view.addSubview(buttonFour)
        view.addSubview(buttonFive)
        view.addSubview(buttonSix)
        view.addSubview(buttonSeven)
        view.addSubview(buttonEight)
        view.addSubview(buttonNine)
        view.addSubview(buttonZero)
        
        
            
        
        passImageView.image = UIImage(named: "visor1")
        
       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Menu")!)
        
        
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
        var numAsString = "\(num)"
        valueString = valueString.stringByAppendingString(numAsString)
        //println(valueString)
        
        
        //MUDA IMAGEM E CONFERE SENHA
        if count(valueString) == 1 {
            passImageView.image = UIImage(named: "visor2")
            lockLabel.text = ""

        } else if count(valueString) == 2 {
            passImageView.image = UIImage(named: "visor3")
        } else if count(valueString) == 3 {
            passImageView.image = UIImage(named: "visor4")
        } else if count(valueString) == 4 && valueString == code {
            valueString = ""
            passImageView.image = UIImage(named: "visor5")
            var controller: MainScreenVC = MainScreenVC(nibName:"MainScreen", bundle:nil)
            self.presentViewController(controller, animated: true, completion: nil)
            
        } else {
            println(code)
            valueString = ""
            lockLabel.text = "wrong"
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
            
            defaults.setInteger(4, forKey: "GamePhase")
            defaults.synchronize()
            
        } else if defaults.integerForKey("LockerIndex") == 2 {
            defaults.setInteger(5, forKey: "GamePhase")
            defaults.synchronize()
        }
        

    }
  
}
