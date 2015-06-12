//
//  ContactMessageViewController.swift
//  FindRachel
//
//  Created by Thiago Gallego on 26/05/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit


class ContactMessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let chatRachelAmanda = [""]
    
    let chatRachelLisa = [""]
    
    let chatRachelJosh = ["Hey Rachel!", "What, Josh?", "Don't be so cold!", "Josh, we're done. I have nothing to talk to you.", "But I do! Me and the horns you got me wearing!", "Josh, stop that! I’ve never cheated on you.", "How come you were going out with another guy the day after breaking up with me?!”, ”Josh, you have nothing to do with my life! Not anymore.", "Why did you leave me, Rachel?", "We've already had this conversation. It's over!", "I like you so much…", "Josh, it's OVER! Come on, what do you wanna talk to me?", "Are you sure you don’t wanna get back?", "…", "Well, you “now… I was searching some images … and I came across some pics…", "Which pictures, Josh?!", "Some pics you gave me when we started dating... if you know what I mean.", "Do you still have those pictures?!You said you had wiped them out!!!", "I really had. But you know, after you broke up with me, I recovered them. Damn it, how I miss your body!", "You are sick, Josh!!!! Go get another girl for you, and PLEASE, wipe out those pictures!!!", "Well, I was thinking about doing something else with them…", "Arggh, for god sake! What, Josh???", "You know, if you don’t wanna be with me no more, there’s no reason why those pics should belong just to me. I think other people could see them.", "Are you threatening me???", "Understand the way you want to.", "Are you really gonna be capable of doing something like that to me? After all those years together?!", "You’ve left me Rachel. What can I do?", "Act like an adult and move on!!!!", "You’ve broken my heart.", "Forget this crazy idea Josh, please! DELETE THOSE PHOTOS!!! We’ve gone through so many incredible moments together! You can't do that to me!", "There’s only one way I won't spread those pics.", "What way? Getting back to you?", "Give me one more chance, Rachel!", "Josh, I know you. I know you are a good person. The Josh I know would never do something like that. You're good. You're different from me! Please, don’t spoil everything!", "I have no choice.", "So guess what? I’m NOT getting back to you! No way!!!!", "I believe you need to think Rachel. I’ll give you 2 days.", "You are playing with fire Josh. It seems you don’t know me.", "And I guess YOU don’t know me. You have two days to decide. On your birthday, I’ll ask you for an answer. It's your choice: the pictures or me.", "I won’t let you do that Josh! I don’t know what I can do if you spread those photos.", "So now YOU are threatening me?", "Understand the way you want to. And remember: you know what I’m capable of.", "I’m not afraid of you.", "And I’m not afraid of you either.", "In two days, you give me an answer.", "I'll give you an answer. If you're still alive.", "So you'll give me an answer. If YOU a“e still alive!"]

    
    //let btableData = ["msg_1_1", "msg_1_2", "msg_1_3"]
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
        
//        talk = Messages.talkList(selected)
        
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
        if selected == 0 {
            
            return chatRachelAmanda.count
            
        } else if selected == 1 {
            
            return chatRachelLisa.count
            
        } else {
            
           return chatRachelJosh.count
        }
        
//    return talk.messsageList.count
    
    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        var message = talk.messsageList[indexPath.row]
//        
//        if (message.owner == rachel) {
//            // Rachel Message
//            var cell:ContactMessagesCell!
//            cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ContactMessagesCell
//            cell.messageLabel.text = chatRachelAmanda[indexPath.row]
//            cell.messageLabel.layer.cornerRadius = 8
//            cell.messageLabel.layer.masksToBounds = true
//            
//            cell.messageLabel.backgroundColor = UIColor(rgba: "#e6e7ec")
//            cell.messageLabel.textColor = UIColor.blackColor()
//            cell.messageLabel.font = UIFont(name: "Helvetica Neue", size: 18)
//            
//            
//            return cell
//        } else {
//            //Contact Mensage
//            var cell:RachelMessagesCell!
//            cell = tableView.dequeueReusableCellWithIdentifier("RachelCell", forIndexPath: indexPath) as! RachelMessagesCell
//            cell.messageLabel.text = chatRachelAmanda[indexPath.row]
//            cell.messageLabel.layer.cornerRadius = 8
//            cell.messageLabel.layer.masksToBounds = true
//            
//            cell.messageLabel.backgroundColor = UIColor(rgba: "#47d533")
//            cell.messageLabel.textColor = UIColor.whiteColor()
//            cell.messageLabel.font = UIFont(name: "Helvetica Neue", size: 18)
//            
//            return cell
//
//        }
//        
        if selected == 0 {
            println(indexPath.row)
            if ((indexPath.row % 2) == 0) {
                
                // Rachel Message
                var cell:ContactMessagesCell!
                cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ContactMessagesCell
                cell.messageLabel.text = chatRachelAmanda[indexPath.row]
                cell.messageLabel.layer.cornerRadius = 8
                cell.messageLabel.layer.masksToBounds = true
                
                cell.messageLabel.backgroundColor = UIColor(rgba: "#e6e7ec")
                cell.messageLabel.textColor = UIColor.blackColor()
                cell.messageLabel.font = UIFont(name: "Helvetica Neue", size: 18)
                
                
                return cell
                
            } else {
                
                //Contact Mensage
                var cell:RachelMessagesCell!
                cell = tableView.dequeueReusableCellWithIdentifier("RachelCell", forIndexPath: indexPath) as! RachelMessagesCell
                cell.messageLabel.text = chatRachelAmanda[indexPath.row]
                cell.messageLabel.layer.cornerRadius = 8
                cell.messageLabel.layer.masksToBounds = true
                
                cell.messageLabel.backgroundColor = UIColor(rgba: "#47d533")
                cell.messageLabel.textColor = UIColor.whiteColor()
                cell.messageLabel.font = UIFont(name: "Helvetica Neue", size: 18)
                
                return cell
            }
        } else if selected == 1 {
            
            if ((indexPath.row % 2) == 0) {
                
                // Rachel Message
                var cell:ContactMessagesCell!
                cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ContactMessagesCell
                cell.messageLabel.text = chatRachelLisa[indexPath.row]
                cell.messageLabel.layer.cornerRadius = 8
                cell.messageLabel.layer.masksToBounds = true
                
                cell.messageLabel.backgroundColor = UIColor(rgba: "#e6e7ec")
                cell.messageLabel.textColor = UIColor.blackColor()
                cell.messageLabel.font = UIFont(name: "Helvetica Neue", size: 18)
                
                return cell
                
            } else {
                
                //Contact Mensage
                var cell:RachelMessagesCell!
                cell = tableView.dequeueReusableCellWithIdentifier("RachelCell", forIndexPath: indexPath) as! RachelMessagesCell
                cell.messageLabel.text = chatRachelLisa[indexPath.row - 3]
                cell.messageLabel.layer.cornerRadius = 8
                cell.messageLabel.layer.masksToBounds = true
                
                cell.messageLabel.backgroundColor = UIColor(rgba: "#47d533")
                
                cell.messageLabel.textColor = UIColor.whiteColor()
                cell.messageLabel.font = UIFont(name: "Helvetica Neue", size: 18)
                
                return cell
            }
            
        } else {
            
            if ((indexPath.row % 2) == 0){
                var cell:ContactMessagesCell!
                cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ContactMessagesCell
                cell.messageLabel.text = chatRachelJosh[indexPath.row]
                cell.messageLabel.layer.cornerRadius = 8
                cell.messageLabel.layer.masksToBounds = true
                
                cell.messageLabel.backgroundColor = UIColor(rgba: "#e6e7ec")
                cell.messageLabel.textColor = UIColor.blackColor()
                cell.messageLabel.font = UIFont(name: "Helvetica Neue", size: 18)
                
                return cell
                
            } else {
                
                //Contact Mensage
                var cell:RachelMessagesCell!
                cell = tableView.dequeueReusableCellWithIdentifier("RachelCell", forIndexPath: indexPath) as! RachelMessagesCell
                cell.messageLabel.text = chatRachelJosh[indexPath.row]
                cell.messageLabel.layer.cornerRadius = 8
                cell.messageLabel.layer.masksToBounds = true
                
                cell.messageLabel.backgroundColor = UIColor(rgba: "#47d533")
                
                cell.messageLabel.textColor = UIColor.whiteColor()
                cell.messageLabel.font = UIFont(name: "Helvetica Neue", size: 18)
                return cell
            }
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

