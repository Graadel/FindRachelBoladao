//
//  ContactMessageViewController.swift
//  FindRachel
//
//  Created by Thiago Gallego on 26/05/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit
import QuartzCore


class ContactMessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //coversa 1
    let conversationOne = ["btableDataRachelAmanda","btableDataContactAmanda"]
    
    let tableDataLorem = ["Lorem", "Ipsum"]
    let tableDataIpsum = ["Ipsum", "Lorem"]
    
    let chatRachelAmanda = ["Bla", "Pimba", "Mariola"]
    let chatAmandaRachel = ["Hey Rach.. Are you going to class today?", "I'm not going today again… I was going to ask if I can copy your notes later… I have some issues at home…","Promise you won’t tell anyone about this…", "It's serious Rach... Can I count on you? I really need a friend at this moment.. I'd rather to tell you face to face but I'm not in the mood to go out..","Sorry, I fell asleep.Ok, well… My father got fired last month. He had been working in this company for 30 years.",""]
    
    
    
    
    //let btableData = ["msg_1_1", "msg_1_2", "msg_1_3"]
    @IBOutlet weak var tableView: UITableView!
    @IBAction func backButton(sender: AnyObject) {
        var controller: Messages = Messages(nibName:"Messages", bundle:NSBundle.mainBundle())
        
        //self.presentViewController(controller, animated: true, completion: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
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
        return 6
        
    }
    
    func tableViewContact(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return chatAmandaRachel.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //Rachel Mensage
        if indexPath.row < 3 {
            var cell:ContactMessagesCell!
            cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ContactMessagesCell
            cell.messageLabel.text = chatRachelAmanda[indexPath.row]
            cell.messageLabel.layer.cornerRadius = 8
            cell.messageLabel.layer.masksToBounds = true
            
            cell.messageLabel.backgroundColor = UIColor(rgba: "#e6e7ec")
            cell.messageLabel.textColor = UIColor.blackColor()
            
            return cell
            
        } else {
            
            //Contact Mensage
            var cell:RachelMessagesCell!
            cell = tableView.dequeueReusableCellWithIdentifier("RachelCell", forIndexPath: indexPath) as! RachelMessagesCell
            cell.messageLabel.text = chatAmandaRachel[indexPath.row - 3]
            cell.messageLabel.layer.cornerRadius = 8
            cell.messageLabel.layer.masksToBounds = true
            
            cell.messageLabel.backgroundColor = UIColor(rgba: "#47d533")
            
            cell.messageLabel.textColor = UIColor.whiteColor()
            
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
