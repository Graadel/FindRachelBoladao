//
//  Photos.swift
//  FindRachel
//
//  Created by Mayara Gasparini Dias  on 25/05/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class Photos: UIViewController, UIScrollViewDelegate {
    
    var imageName: String = ""
    var image: UIImage!
    var imageView: UIImageView!
    
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image = UIImage(named: imageName)
        imageView = UIImageView(image: image!)
        
        imageView.contentMode = .ScaleAspectFit
        imageView.frame = CGRect(origin: CGPointMake(0.0, 0.0), size:image.size)
        
        scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 50, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height - 50)
        scrollView.contentSize = image!.size
        
        imageView.center = scrollView.center
        
        scrollView.delegate = self
        
        self.scrollView.backgroundColor = UIColor.blackColor()
        
        var doubleTapRecognizer = UITapGestureRecognizer(target: self, action: "scrollViewDoubleTapped:")
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(doubleTapRecognizer)

        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight);
        scrollView.minimumZoomScale = minScale;
        
        scrollView.maximumZoomScale = 1.0
        scrollView.zoomScale = minScale;
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        
        centerScrollViewContents()
        
    
        
    }
    
    func scrollViewDoubleTapped(recognizer: UITapGestureRecognizer) {

        let pointInView = recognizer.locationInView(imageView)
        
        var newZoomScale = scrollView.zoomScale * 1.5
        newZoomScale = min(newZoomScale, scrollView.maximumZoomScale)
        
        let scrollViewSize = scrollView.bounds.size
        let w = scrollViewSize.width / newZoomScale
        let h = scrollViewSize.height / newZoomScale
        let x = pointInView.x - (w / 2.0)
        let y = pointInView.y - (h / 2.0)
        
        let rectToZoomTo = CGRectMake(x, y, w, h);
        
        scrollView.zoomToRect(rectToZoomTo, animated: true)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        centerScrollViewContents()
        return imageView
    }
    
    func viewForScroll(scrollView: UIScrollView) -> UIView? {
        centerScrollViewContents()
        return imageView
    }

    
    func centerScrollViewContents() {
        let boundsSize = scrollView.bounds.size
        var contentsFrame = imageView.frame
        
        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0
        } else {
            contentsFrame.origin.x = 0.0
        }
        
        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0
        } else {
            contentsFrame.origin.y = 0.0
        }
        
        imageView.frame = contentsFrame
        
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        centerScrollViewContents()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
