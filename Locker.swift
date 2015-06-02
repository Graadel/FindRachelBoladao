//
//  Locker.swift
//  FindRachel
//
//  Created by Mayara Gasparini Dias  on 19/05/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit



class Locker: UIViewController {

    
    var valueString = ""
    @IBOutlet weak var lockLabel: UILabel!
    @IBOutlet weak var passImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        
        println(numAsString)
        
        //MUDA IMAGEM E CONFERE SENHA
        if count(valueString) == 1 {
            passImageView.image = UIImage(named: "1")
            lockLabel.text = ""
            //TODO: apagar as duas linhas quando pronto!
            var controller: MainScreen = MainScreen(nibName:"MainScreen", bundle:NSBundle.mainBundle())
            self.presentViewController(controller, animated: true, completion: nil)
        } else if count(valueString) == 2 {
            passImageView.image = UIImage(named: "2")
            //lockLabel.text = valueString
        } else if count(valueString) == 3 {
            passImageView.image = UIImage(named: "3")
            //lockLabel.text = valueString
        } else if count(valueString) == 4 && valueString == "1234"
        {
            valueString = ""
            passImageView.image = UIImage(named: "4")
            //lockLabel.text = "arrasou"
            //performSegueWithIdentifier("correct", sender: nil)
            
            var controller: MainScreen = MainScreen(nibName:"MainScreen", bundle:NSBundle.mainBundle())
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
