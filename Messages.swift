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
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func backButton(sender: AnyObject) {
        var controller: MainScreenVC = MainScreenVC(nibName:"MainScreen", bundle:NSBundle.mainBundle())
        
        //self.presentViewController(controller, animated: true, completion: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    var talkList: [Talk]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register custom cell
        var nib = UINib(nibName: "MessagesTVCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        talkList = [Talk]()
        
        //PESSOAS
        let rachel = Person(name: "Rachel")
        let amanda = Person(name: "Amanda")
        let lisa = Person(name: "Lisa")
        let josh = Person(name: "Josh")
        let fer = Person(name: "Fernanda")
        
        //CONVERSAS
        let amandaMessages = [Message(text: "Oi", owner: amanda), Message(text: "Ola", owner: rachel), Message(text: "tudo bem?", owner: amanda), Message(text: "não", owner: rachel)]
        let lisaMessages = [Message(text: "ai termina esse app", owner: lisa), Message(text: "Cristo pai", owner: rachel), Message(text: "tô tentando", owner: rachel)]
        let joshMessages = [Message(text: "Ola", owner: josh), Message(text: "Oi", owner: rachel)]
        let ferMessages = [Message(text: "Hey Rach.. Are you going to class today?", owner: fer), Message(text: "Yep!!! R U? Why are you missing classes so much?", owner: rachel), Message(text: "oh, fuck you!", owner: rachel)]
        
        //LISTA DE CONVERSAS
        talkList.append(Talk(remetente: amanda, messsageList: amandaMessages))
        talkList.append(Talk(remetente: lisa, messsageList: lisaMessages))
        talkList.append(Talk(remetente: josh, messsageList: joshMessages))
        talkList.append(Talk(remetente: fer, messsageList: ferMessages))
        
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
            return talkList.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        
        var cell:MessagesCell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as! MessagesCell
        cell.nameLabel.text = talkList[indexPath.row].remetente.name
        cell.lastMessageLabel.text = "last message"
        cell.dayLabel.text = "domingo"
        cell.pinImage.image = UIImage(named: "pin")
          
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Row \(indexPath.row) selected")
        
        var messageController: ContactMessageViewController = ContactMessageViewController(nibName:"ContactMessageViewController", bundle:NSBundle.mainBundle())
        messageController.talk = talkList[indexPath.row]
        
        selected = indexPath.row
        
        self.presentViewController(messageController, animated: true, completion: nil)

        
    }
 
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
}
