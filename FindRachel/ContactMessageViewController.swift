//
//  ContactMessageViewController.swift
//  FindRachel
//
//  Created by Thiago Gallego on 26/05/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit


class ContactMessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    @IBAction func backButton(sender: AnyObject) {
        var controller: Messages = Messages(nibName:"Messages", bundle:NSBundle.mainBundle())
        
        //self.presentViewController(controller, animated: true, completion: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    var talk: Talk!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register custom cells
        //contacts
        
        var nib = UINib(nibName: "ContactMessagesTVCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        
        //Rachel
        var nibR = UINib(nibName: "RachelMessagesTVCell", bundle: nil)
        tableView.registerNib(nibR, forCellReuseIdentifier: "RachelCell")
        
        configureTableView()
        
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

        return talk.messsageList.count

    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
 
        
        
        var message = talk.messsageList[indexPath.row]

        if talk.messsageList[indexPath.row].owner.name == "Rachel"
        {
            var cell:RachelMessagesCell!
            cell = tableView.dequeueReusableCellWithIdentifier("RachelCell", forIndexPath: indexPath) as! RachelMessagesCell
            cell.messageLabel.text = talk.messsageList[indexPath.row].text
            cell.messageLabel.layer.cornerRadius = 8
            cell.messageLabel.layer.masksToBounds = true
            
            cell.messageLabel.backgroundColor = UIColor(rgba: "#47d533")
            cell.messageLabel.textColor = UIColor.whiteColor()
            cell.messageLabel.font = UIFont(name: "Helvetica Neue", size: 18)
            

            return cell
        } else {
            var cell:ContactMessagesCell!
            cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ContactMessagesCell
            cell.messageLabel.text = talk.messsageList[indexPath.row].text
            cell.messageLabel.layer.cornerRadius = 8
            cell.messageLabel.layer.masksToBounds = true
            
            cell.messageLabel.backgroundColor = UIColor(rgba: "#e6e7ec")
            cell.messageLabel.textColor = UIColor.blackColor()
            cell.messageLabel.font = UIFont(name: "Helvetica Neue", size: 18)
            
            return cell
        }
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Row \(indexPath.row) selected")

    }


    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160.0
    }
   
        
}

