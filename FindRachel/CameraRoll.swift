//
//  CameraRoll.swift
//  FindRachel
//
//  Created by Mayara Gasparini Dias  on 28/05/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class CameraRoll: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    var imagens: Int! = 0
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func backButton(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    var imageView = UIImageView()
    
    var Array: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
             self.view.backgroundColor = UIColor.whiteColor()
        
        Array=["r1","r2","arvore","r3","coqueiro","pato","sushi","r4","kat","praia","r5","agua","pordosol","sapatilha","r6","r7","xicara","casa","grade","sinal","doce","paisagem","ilha","pizza","patos","marepedras","mesas","r9"]
        
        
        
        
        self.collectionView.registerNib(UINib(nibName:"IconCellCameraRoll", bundle:NSBundle.mainBundle()), forCellWithReuseIdentifier: "cell")
        
        let size = CGFloat((UIApplication.sharedApplication().windows.first!.size.width/3)-2);
        (self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSizeMake(size, size);
        
    }
    
    override func viewDidAppear(animated: Bool) {
        println(imagens)
        

        if (imagens == 3){
            defaults.setBool(true, forKey: "PhotosViewed")
            defaults.synchronize()
        }
        
        println(defaults.boolForKey("NotesViewed"))
        println(defaults.boolForKey("PhotosViewed"))
        
        if ((defaults.boolForKey("NotesViewed") == true) &&  defaults.boolForKey("PhotosViewed") == true){
            
            var lockerVC: LockerVC = LockerVC(nibName:"Locker", bundle: nil)
            self.presentViewController(lockerVC, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Collection View DataSource
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return Array.count
        
    }
    
    // essa func adiciona imagens aos icons
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! IconCellCameraRoll
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, cell.frame.width, cell.frame.height));
        imageView.image = UIImage(named: Array[indexPath.row]);
        imageView.contentMode = UIViewContentMode.ScaleAspectFill;
        imageView.clipsToBounds = true;
        cell.contentView.addSubview(imageView);
        
        //cell.imageCellCameraRoll.image = UIImage(named: Array[indexPath.row])
        //cell.imageCellCameraRoll.contentMode = UIViewContentMode.ScaleAspectFill
        //cell.imageCellCameraRoll.clipsToBounds = true
        
        return cell
        
    }
    
    
    // MARK: - Collection View Delegate
    
    //essa func faz c que os icons clicados abram a viewcontroller desejada (ex: messages, gallery..)
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
        
    {
        
        let image = UIImage(named: Array[indexPath.row])
        
        println(indexPath.row)
        
        if (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2){
            imagens = imagens + 1
        }
        
        
        var controller: Photos = Photos(nibName:"Photos", bundle:NSBundle.mainBundle())
        controller.imageName = Array[indexPath.row]
        
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    
    /*  // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
