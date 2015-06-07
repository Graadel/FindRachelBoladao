//
//  BlockedVC.swift
//  FindRachel
//
//  Created by Carol Grädel on 5/29/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class BlockedVC: UIViewController, UIScrollViewDelegate{
    
    let kInterpolateStagesWithAlpha = true
    let kScrollViewTravel = 200.0
    let kMaximumBlurRadius = 25.0
    let kNumberOfStages = 10
    
    var imageView: UIImageView!
    var imageView2: UIImageView!
    var background: UIImage!
    var animator: Animator!
    var booleano: Bool!
    
    
    var blurredImages: [UIImage] = []
    var scrollView: UIScrollView! = UIScrollView()


    override func viewDidLoad() {
        super.viewDidLoad()
        booleano = true
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Menu.png")!)
        
         UIApplication.sharedApplication().statusBarHidden = true

    }
    
    override func prefersStatusBarHidden() -> Bool {
        return booleano
    }
    
    override func viewWillAppear(animated: Bool) {
        background = UIImage(named: "fundo")
        
        var hora: UILabel = UILabel(frame: CGRectMake(0,0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height/4))
        hora.text = "17:84"
        hora.textAlignment = .Center
        hora.textColor = UIColor.whiteColor()
        hora.font = UIFont(name: "Avenir-Book", size: 65)
                
        var dia: UILabel = UILabel(frame: CGRectMake(0,0,UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height/2.5))
        dia.text = "saturday, 30 of may"
        dia.textAlignment = .Center
        dia.textColor = UIColor.whiteColor()
        dia.font = UIFont(name: "Avenir-Book", size: 28)
        
        var blur = UIBlurEffect (style: UIBlurEffectStyle.Dark)
        var blurView = UIVisualEffectView(effect: blur)
        blurView.frame = UIScreen.mainScreen().bounds
        blurView.alpha = 0.5
        
        imageView = UIImageView(image: background)
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
     
        imageView.frame = UIScreen.mainScreen().bounds
        
        view.addSubview(imageView)
        view.addSubview(blurView)
        view.addSubview(hora)
        view.addSubview(dia)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        UIApplication.sharedApplication().statusBarHidden = false
        
        booleano = false
        self.prefersStatusBarHidden()
    }
    
}
