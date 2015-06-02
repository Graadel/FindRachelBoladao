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
    var defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    self.collectionView.registerNib(UINib(nibName:"IconCellMainScreen", bundle:NSBundle.mainBundle()), forCellWithReuseIdentifier: "cell")

    }
    
    //
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
  
        if defaults.integerForKey("GamePhase") == 7 {
            // Aparece mensagem
            
            println("Aparece mensagem!")
            
            delay(2){
                
                var controller = BlockedVC(nibName:"BlockedVC", bundle:nil)
                self.presentViewController(controller, animated: true, completion: nil)
            }
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Collection View DataSource

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 7
    }
    
    // essa func adiciona imagens aos icons
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! IconCellMainScreen
        
        if indexPath.row == 0 {
            
            cell.imageCell.image = UIImage(named: "messages.png")

        } else if indexPath.row == 1 {
            
            cell.imageCell.image = UIImage(named: "gallery.png")
        }
        
        else if indexPath.row == 2 {
        
            cell.imageCell.image = UIImage(named: "notas.png")
            
        } else if indexPath.row == 3 {
            
            cell.imageCell.image = UIImage(named: "insta.png")
            
        } else if indexPath.row == 4 {
            
            cell.imageCell.image = UIImage(named: "snap.png")
            
        } else if indexPath.row == 5 {
            
            cell.imageCell.image = UIImage(named: "tinder.png")
            
        } else if indexPath.row == 6 {
            
            cell.imageCell.image = UIImage(named: "twitter.png")
            
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
