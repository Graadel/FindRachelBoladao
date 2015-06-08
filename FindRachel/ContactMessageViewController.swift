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

    let btableData = ["hshdklsdjas fas d asdsadas dassa dasdasdasdsa fdfasdsadasdas dasdasdasdasd fdfsaasdas", "hshdklsdjas fas d asdsadas dassa dasdasdasdsa fdfasdsadasdas dasdasdasdasd fdfsaasdas HKKJDSKSDSJKND DS DSSDSDSSDSDSGFD GFDFDGDFGDFGDFBV HTRHTRHTRFDFDS", "hshdklsdjas fas d asdsadas dassa dasdasdasdsa fdfasdsadasdas dasdasdasdasd fdfsaasdas HKKJDSKSDSJKND DS DSSDSDSSDSDSGFD GFDFDGDFGDFGDFBV HTRHTRHTRFDFDS fas d asdsadas dassa dasdasdasdsa fdfasdsadasdas dasdasdasdasd fdfsaasdas HKKJDSKSDSJKND DS DSSDSDSSDSDSGFD GFDFDGDFGDFGDFBV HTRHTRHTRFDFDSfas d asdsadas dassa dasdasdasdsa fdfasdsadasdas dasdasdasdasd fdfsaasdas HKKJDSKSDSJKND DS DSSDSDSSDSDSGFD GFDFDGDFGDFGDFBV HTRHTRHTRFDFDS"]
    
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
        return btableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            var cell:ContactMessagesCell!
            cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ContactMessagesCell
            cell.messageLabel.text = btableData[indexPath.row]
            cell.messageLabel.layer.cornerRadius = 8
            cell.messageLabel.layer.masksToBounds = true
            cell.messageLabel.backgroundColor = UIColor.blueColor()
            cell.messageLabel.textColor = UIColor.whiteColor()
            
            return cell
            
        } else {
            var cell:RachelMessagesCell!
            cell = tableView.dequeueReusableCellWithIdentifier("RachelCell", forIndexPath: indexPath) as! RachelMessagesCell
            cell.messageLabel.text = btableData[indexPath.row]
            cell.messageLabel.layer.cornerRadius = 8
            cell.messageLabel.layer.masksToBounds = true
            cell.messageLabel.backgroundColor = UIColor.grayColor()
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
