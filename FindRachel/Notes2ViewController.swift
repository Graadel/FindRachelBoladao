//
//  Notes2ViewController.swift
//  FindRachel
//
//  Created by Mayara Gasparini Dias  on 27/05/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

class Notes2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBAction func backButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
  
    var imagens: Int! = 0
    var defaults = NSUserDefaults.standardUserDefaults()
    
  
    @IBOutlet var tableView: UITableView!
    
    var tableData = [NSLocalizedString("Help\nHelp\nHelp\nHhlp\nHelp\nHelp\nHelp\nHepl\nHelp\nHelp\nHelp\nHelp\nHlep\nHelp\nHelp\nHelp\nHelp\nHelp\nHelpehel\nHele\nHepl\nGelep\nHepl\nHell\n", comment: "Help\nHelp\nHelp\nHhlp\nHelp\nHelp\nHelp\nHepl\nHelp\nHelp\nHelp\nHelp\nHlep\nHelp\nHelp\nHelp\nHelp\nHelp\nHelpehel\nHele\nHepl\nGelep\nHepl\nHell\n") ,NSLocalizedString("Buy:\n \nEggs\nWatermelon\nOrange Juice\nBread\nBacon\nGloves\nRope\nTape\nKnife\n \nI think that will be enough...\n", comment: "Buy:\n \nEggs\nWatermelon\nOrange Juice\nBread\nBacon\nGloves\nRope\nTape\nKnife\n \nI think that will be enough...\n") , NSLocalizedString("difficult times will always reveal TRUE friends", comment: " difficult times will always reveal TRUE friends") , NSLocalizedString("I just want to get this off my chest:\n \nThings are really strange.\nI’m losing all my friends.\nEverybody is mad at me.\nAnd I can't understand why. I should be mad at them, not the opposite.\nI feel that something really bad is about to happen...\nI can feel this...\n", comment: "I just want to get this off my chest:\n \nThings are really strange.\nI’m losing all my friends.\nEverybody is mad at me.\nAnd I can't understand why. I should be mad at them, not the opposite.\nI feel that something really bad is about to happen...\nI can feel this...\n"),  NSLocalizedString("Plans to Weekend:\n \nFriday 20/10 (Birthday. YEY!):\nDinner with family\n \nSaturday 21/10:\n9 a.m: Philosophy Test\n3 p.m: Hairdresser\n10 p.m: Night Club\n \nSunday 22/10:\n5 p.m: Cinema w/ Carol\n", comment: "Plans to Weekend:\n \nFriday 20/10 (Birthday. YEY!):\nDinner with family\n \nSaturday 21/10:\n9 a.m: Philosophy Test\n3 p.m: Hairdresser\n10 p.m: Night Club\n \nSunday 22/10:\n5 p.m: Cinema w/ Carol\n") , NSLocalizedString("she's leaving home \n after living alone \n for so many years", comment: "she's leaving home \n after living alone \n for so many years")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        var nib = UINib(nibName: "NotesCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        println(imagens)
        
        if (imagens == 3){
            defaults.setBool(true, forKey: "NotesViewed")
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:NotesTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! NotesTableViewCell
        
        cell.labelNotes.text = tableData[indexPath.row]
        
        
        
        return cell
        
    }
    
    //func q seleciona a celula e leva para uma view
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    

        var controller = NotesVC(nibName:"NotesView", bundle:NSBundle.mainBundle())
        self.presentViewController(controller, animated: true, completion: nil)
        
        println(indexPath.row)
        
        if (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2){
            imagens = imagens + 1
        }
        
        controller.noteText.text = tableData[indexPath.row]
        
        
        println(indexPath.row)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
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
