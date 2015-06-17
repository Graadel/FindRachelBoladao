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
    
    @IBOutlet weak var restartButton: UIButton!
    
    @IBAction func refreshAction(sender: AnyObject) {
        
        defaults.setInteger(1, forKey: "GamePhase")
        defaults.synchronize()
        
        defaults.setInteger(1, forKey: "LockerIndex")
        defaults.synchronize()
        
        defaults.setBool(false, forKey: "PhotosViewed")
        defaults.synchronize()
        
        defaults.setBool(false, forKey: "NotesViewed")
        defaults.synchronize()
        
        var videoVC: VideoVC = VideoVC(nibName:"VideoVC", bundle: nil)
        self.presentViewController(videoVC, animated: true, completion: nil)
        
    }
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
        

        // IMAGEM DE FUNDO
        imageView = UIImageView(image: UIImage(named:"menublur"))
        
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
        view.addSubview(restartButton)
        
        passImageView.image = UIImage(named: "visor1")
        
       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Menu")!)
        
      
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if defaults.integerForKey("LockerIndex") == 0 {
            code = "2010"
        }
        //true = 8783
        if defaults.integerForKey("LockerIndex") == 1 {
            code = "8783"
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
        
        //MUDA IMAGEM E CONFERE SENHA
        if count(valueString) == 1 {
            passImageView.image = UIImage(named: "visor2")
            lockLabel.text = ""

        } else if count(valueString) == 2 {
            passImageView.image = UIImage(named: "visor3")
        } else if count(valueString) == 3 {
            passImageView.image = UIImage(named: "visor4")
        } else if count(valueString) == 4 {

            passImageView.image = UIImage(named: "visor5")
            
            //SENHA OK
            if (valueString == code){

                setDefaultValues()

            //SENHA ERRADA
            } else {
                let delay = 0.3 * Double(NSEC_PER_SEC)
                let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
                dispatch_after(time, dispatch_get_main_queue()) {
                    self.valueString = ""
                    self.lockLabel.text = "wrong"
                    self.passImageView.image = UIImage(named: "visor1")

                }
            }

        }
    
    }
    
    func setDefaultValues(){
        
        var controller : UIViewController = UIViewController()
        
        if defaults.integerForKey("LockerIndex") == 0 {
            
            defaults.setInteger(1, forKey: "LockerIndex")
            defaults.setInteger(2, forKey: "GamePhase")
            defaults.synchronize()
            
            controller = MainScreenVC(nibName:"MainScreen", bundle:nil)
            
        } else if defaults.integerForKey("LockerIndex") == 1 {
            
            defaults.setInteger(2, forKey: "LockerIndex")
            defaults.setInteger(3, forKey: "GamePhase")
            defaults.synchronize()
            
            controller = MainScreenVC(nibName:"MainScreen", bundle:nil)
            
        } else if defaults.integerForKey("LockerIndex") == 2 {

            defaults.setInteger(4, forKey: "GamePhase")
            defaults.synchronize()
            
            var finishedVC: FinishedVC = FinishedVC()
        }
        
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
}
