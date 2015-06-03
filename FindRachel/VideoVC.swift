//
//  VideoVC.swift
//  FindRachel
//
//  Created by Carol Grädel on 5/29/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class VideoVC: UIViewController {
    
    var moviePlayer: MPMoviePlayerController?
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playVideo()
        //Velocidade do video
        moviePlayer?.currentPlaybackRate = 10.0
        
        //demora para da o play
        delay(2){
        
        var lockerVC: LockerVC = LockerVC(nibName:"Locker", bundle: nil)
        self.presentViewController(lockerVC, animated: true, completion: nil)
        
        }
        
    }
    

    override func viewWillDisappear(animated: Bool) {
        
        defaults.setInteger(2, forKey: "GamePhase")
        defaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func playVideo() {
        
        let path = NSBundle.mainBundle().pathForResource("findrachelfinal", ofType: "mp4")
        let url = NSURL.fileURLWithPath(path!)
        moviePlayer = MPMoviePlayerController(contentURL: url)
        
        if let player = moviePlayer {
            
            AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient, error: nil)
            
            player.view.frame = UIScreen.mainScreen().bounds
            player.prepareToPlay()
            player.scalingMode = .AspectFit
            player.controlStyle = .None
            self.view.addSubview(player.view)
            player.play()
        }
        
    }
    

    // DELAY IN SECONDS TO EXECUTE A CODE
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

}
