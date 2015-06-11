//
//  Messages.swift
//  FindRachel
//
//  Created by Mayara Gasparini Dias  on 19/05/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit
import SpriteKit

var selected: Int!

class Messages: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //UITableViewDataSource
    
    let tableData = ["Amanda", "NSHipster", "iOS Developer Tips", "Jameson Quave", "Natasha The Robot", "Coding Explorer", "That Thing In Swift", "Andrew Bancroft", "iAchieved.it", "Airspeed Velocity"]
    @IBOutlet weak var tableView: UITableView!
    @IBAction func backButton(sender: AnyObject) {
        var controller: MainScreenVC = MainScreenVC(nibName:"MainScreen", bundle:NSBundle.mainBundle())
        
        //self.presentViewController(controller, animated: true, completion: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register custom cell
        var nib = UINib(nibName: "MessagesTVCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
            return tableData.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "mycell")
        
        // cell.textLabel!.text = swiftBlogs[indexPath.row]
        
        var cell:MessagesCell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as! MessagesCell
        cell.nameLabel.text = tableData[indexPath.row]
        cell.lastMessageLabel.text = tableData[indexPath.row]
        cell.dayLabel.text = "domingo"
        cell.pinImage.image = UIImage(named: "pin")
          
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Row \(indexPath.row) selected")
        
        var messageController: ContactMessageViewController = ContactMessageViewController(nibName:"ContactMessageViewController", bundle:NSBundle.mainBundle())
        
        selected = indexPath.row
        
        self.presentViewController(messageController, animated: true, completion: nil)

        
    }
 
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
}
