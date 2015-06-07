//
//  ReceivedFiles.swift
//  FindRachel
//
//  Created by Mayara Gasparini Dias  on 28/05/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class ReceivedFiles: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
    
    @IBAction func backButton(sender: AnyObject) {
       
        self.dismissViewControllerAnimated(true, completion: nil)
    }
   
    
    var imageView = UIImageView()
    
    var Array: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
             self.view.backgroundColor = UIColor.whiteColor()
        Array=["h","h1","h2","h3","h4","h5","h6","h7","h8","h9"]
        
        
        self.collectionView.registerNib(UINib(nibName:"IconCellReceivedFiles", bundle:NSBundle.mainBundle()), forCellWithReuseIdentifier: "cell")
        
        
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
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! IconCellReceivedFiles
        
        cell.imageCellReceived.image = UIImage(named: Array[indexPath.row])
        cell.imageCellReceived.image = UIImage(named: Array[indexPath.row])
        cell.imageCellReceived.contentMode = UIViewContentMode.ScaleAspectFill
        cell.imageCellReceived.clipsToBounds = true
        
        return cell
        
    }
    
    
    // MARK: - Collection View Delegate
    
    //essa func faz c que os icons clicados abram a viewcontroller desejada (ex: messages, gallery..)
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
        
    {
        
        let image = UIImage(named: Array[indexPath.row])
        //let imageView = UIImageView(image: image!)
        
        //        imageView = UIImageView (image: image!)
        //        imageView.contentMode = .ScaleAspectFit
        //        imageView.frame = CGRect(x: 0, y: 0, width: 400, height: 600)
        //        view.addSubview(imageView)
        
        println(indexPath.row)
        
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
