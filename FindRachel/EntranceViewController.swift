//
//  EntranceViewController.swift
//  FindRachel
//
//  Created by Julia Motta Baitelli on 12/06/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class EntranceViewController: UIViewController {

    @IBAction func startButton(sender: AnyObject) {
    
        var videoVC: VideoVC = VideoVC(nibName:"VideoVC", bundle: nil)
        self.presentViewController(videoVC, animated: true, completion: nil)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
