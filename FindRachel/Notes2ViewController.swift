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
    
    var tableData = ["All you need is love, love...","I just want to get this off my chest:\n \nThings are really strange...\nI’m losing all my friends.\nEverybody is mad at me.\nAnd I can't understand why. I should be mad at them, not the opposite.\nI feel that something really bad is about to happen...\nI can feel this…..","I've never felt this way...", "Love you, xoxo Chloe...", "I make poems...", "Buy eggs", "Download: Gone Girl "]
    
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
