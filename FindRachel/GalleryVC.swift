//
//  Gallery.swift
//  FindRachel
//
//  Created by Mayara Gasparini Dias  on 20/05/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class GalleryVC: UIViewController{

    @IBAction func backButton(sender: AnyObject) {
        
    self.dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
             self.view.backgroundColor = UIColor.whiteColor()
        
        let tamanho = UIApplication.sharedApplication().windows.first!.size;
        let altura = tamanho.height*0.12;
        
        let tamBotone = tamanho.width*0.4
        
        let cameraBotone = UIButton(frame: CGRectMake(0.25*tamanho.width-tamBotone*0.5, altura, tamBotone, tamBotone));
        cameraBotone.setImage(UIImage(named: "CameraRoll"), forState: UIControlState.Normal);
        cameraBotone.addTarget(nil, action: "irPraCameraRoll", forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(cameraBotone);
        
        let receivedBotone = UIButton(frame: CGRectMake(0.75*tamanho.width-tamBotone*0.5, altura, tamBotone, tamBotone));
        receivedBotone.setImage(UIImage(named: "ReceivedFiles"), forState: UIControlState.Normal);
        receivedBotone.addTarget(nil, action: "irPraReceivedFiles", forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(receivedBotone);
        
        
        // Do any additional setup after loading the view.
        
        
    }
    
    func irPraCameraRoll(){
        var controller: CameraRoll = CameraRoll(nibName:"CameraRoll", bundle:NSBundle.mainBundle())
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    func irPraReceivedFiles(){
        var controller: ReceivedFiles = ReceivedFiles(nibName:"ReceivedFiles", bundle:NSBundle.mainBundle())
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    //
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
  
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Collection View DataSource
    
}