//
//  Gallery.swift
//  FindRachel
//
//  Created by Mayara Gasparini Dias  on 20/05/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class GalleryVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!

    @IBAction func backButton(sender: AnyObject) {
        
    self.dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
             self.view.backgroundColor = UIColor.whiteColor()
        
        // Do any additional setup after loading the view.
        
        
        self.collectionView.registerNib(UINib(nibName:"IconCellGallery", bundle:NSBundle.mainBundle()), forCellWithReuseIdentifier: "cell")
        
    }
    
    //
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        //func q faz a tela de msg abrir dps do locker somente qnd o jogador abre o jogo pela primeira vez
        
        //        if NSUserDefaults.standardUserDefaults().boolForKey("HasLaunchedOnce") {
        //
        //            // app already launched
        //
        //        } else {
        //
        //            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "HasLaunchedOnce")
        //            NSUserDefaults.standardUserDefaults().synchronize()
        //
        //            var controller: Messages = Messages(nibName:"Messages", bundle:NSBundle.mainBundle())
        //
        //            self.presentViewController(controller, animated: true, completion: nil)
        //
        //        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Collection View DataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }
    
    // essa func adiciona imagens aos icons
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! IconCellGallery
        
        if indexPath.row == 0 {
            
            cell.imageCellGallery.image = UIImage(named: "CameraRoll")
            
        } else if indexPath.row == 1 {
            
            cell.imageCellGallery.image = UIImage(named: "ReceivedFiles1")
        }
            
  
        
        return cell
    }
    
    // MARK: - Collection View Delegate
    
    
    //essa func faz c que os icons clicados abram a viewcontroller desejada (ex: messages, gallery..)
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
        
    {
        if indexPath.row == 0 {
            
            var controller = CameraRoll(nibName:"CameraRoll", bundle:NSBundle.mainBundle())
            
            self.presentViewController(controller, animated: true, completion: nil)
            
        } else if indexPath.row == 1 {
            
            var controller = ReceivedFiles(nibName:"ReceivedFiles", bundle:NSBundle.mainBundle())
            
            self.presentViewController(controller, animated: true, completion: nil)
            
        }
        
        
        println(indexPath.row)
        
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

    
//
//  /*  // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//*/
//

