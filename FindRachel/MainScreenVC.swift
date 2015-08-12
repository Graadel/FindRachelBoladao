//
//  MainScreen.swift
//  FindRachel
//
//  Created by Mayara Gasparini Dias  on 21/05/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class MainScreenVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet var collectionView: UICollectionView!
    
    var imageView: UIImageView!
    var defaults = NSUserDefaults.standardUserDefaults()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        imageView = UIImageView(image: UIImage(named: "menu_ipad.png"))
        
        imageView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
        imageView.contentMode = UIViewContentMode.ScaleToFill
        //ScaleToFill
        
        self.collectionView.registerNib(UINib(nibName:"IconCellMainScreen", bundle:NSBundle.mainBundle()), forCellWithReuseIdentifier: "cell")
        
        view.addSubview(imageView)
        view.addSubview(collectionView)
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
  
//        if defaults.integerForKey("GamePhase") == 7 {
//            println("Aparece mensagem!")
//            
//            delay(2){
//                
//                var controller = BlockedVC(nibName:"BlockedVC", bundle:nil)
//                self.presentViewController(controller, animated: true, completion: nil)
//            }
//        }
        
        if (defaults.boolForKey("tipShowed") == false) {
            
            var alert = UIAlertController(title: NSLocalizedString("Tip:", comment: "Tip:"), message: NSLocalizedString("PrintScreen is your BFF", comment: "PrintScreen is your BFF"), preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
            
            defaults.setBool(true, forKey: "tipShowed")
        }
      

    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 11
    }
    
    // essa func adiciona imagens aos icons
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! IconCellMainScreen
        
        if indexPath.row == 0 {
            
            cell.imageCell.image = UIImage(named: "messages.png")

        } else if indexPath.row == 1 {
            
            cell.imageCell.image = UIImage(named: "photos.png")
        }
        
        else if indexPath.row == 2 {
        
            cell.imageCell.image = UIImage(named: "notes.png")
            
        } else if indexPath.row == 3 {
            
            cell.imageCell.image = UIImage(named: "Insta.png")
            
        } else if indexPath.row == 4 {
            
            cell.imageCell.image = UIImage(named: "snapp")
            
        } else if indexPath.row == 5 {
            
            cell.imageCell.image = UIImage(named: "tinder.png")
            
        } else if indexPath.row == 6 {
            
            cell.imageCell.image = UIImage(named: "Twitter.png")
            
        } else if indexPath.row == 7 {
            
            cell.imageCell.image = UIImage(named: "music.png")
            
        } else if indexPath.row == 8 {
            
            cell.imageCell.image = UIImage(named: "fone.png")
        } else if indexPath.row == 9{
                
                cell.imageCell.image = UIImage(named: "sms.png")
        } else if indexPath.row == 10 {
            
            cell.imageCell.image = UIImage(named: "internet.png")
            
        }
        
        return cell
    }
    
    // MARK: - Collection View Delegate
    
    
    //essa func faz c que os icons clicados abram a viewcontroller desejada (ex: messages, gallery..)
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
   
        {
        if indexPath.row == 0 {
        
            var controller = Messages(nibName:"Messages", bundle:NSBundle.mainBundle())
            
            self.presentViewController(controller, animated: true, completion: nil)
        
        } else if indexPath.row == 1 {
        
            var controller = GalleryVC(nibName:"Gallery", bundle:NSBundle.mainBundle())
            
            self.presentViewController(controller, animated: true, completion: nil)
        
        } else if indexPath.row == 2 {
            
            var controller = Notes2ViewController(nibName:"Notes2ViewController", bundle:NSBundle.mainBundle())
            
            self.presentViewController(controller, animated: true, completion: nil)
            
        } else {
            var alert = UIAlertController(title: NSLocalizedString("LOCKED", comment: "LOCKED"), message: "", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        } 

     println(indexPath.row)
        
    }
}
