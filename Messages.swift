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
        let william = Person(name: "William")
        let mom = Person(name: "Mom")
        let annie = Person(name: "Annie")
        
        //CONVERSAS
        let amandaMessages = [Message(text: "Hey Rach... Are you going to class today?", owner: amanda), Message(text: "Yep!! R U? Why are you missing classes so much?", owner: rachel), Message(text: "I'm not going today again...I was going to ask if I can copy your notes later… I have some issues at home… ", owner: amanda), Message(text: "Of course! What happened, Mandy? :(", owner: rachel), Message(text: "Promise you won’t tell anyone about this…", owner: amanda), Message(text: "Of course I won’t!!!! You are my BFF!!!!", owner: rachel), Message(text: "It's serious Rach... Can I count on you? I really need a friend at this moment.. I'd rather to tell you face to face but I'm not in the mood to go out..", owner: amanda), Message(text: "Yes Amanda, you can count on me. I won’t tell anyone.", owner: rachel), Message(text: "Mandy?", owner: rachel), Message(text: "Sorry, I fell asleep. Ok, well… My father got fired last month. He had been working in this company for 30 years.", owner: amanda), Message(text: "OMG, Amanda, I'm so sorry :( I didn’t know.. He had an important position, didn't he?", owner: rachel), Message(text: "Yes… And my mom stopped working when she got pregnant of my little sister. So now things are terrible. I had to quit my painting classes and my sister had to quit ballet to save money. My father and mother are looking for a job desperately.", owner: amanda), Message(text: "Oh Amanda, I can imagine how you feel, but things will get better. Why didn’t you tell me before? ", owner: rachel), Message(text: "Cause it’s been very difficult to me. And this is not the worst thing…", owner: amanda), Message(text: "Not the worst thing?", owner: rachel), Message(text: "My father has been drinking too much… When he drinks, he gets very moody. Sometimes he cries a lot and sometimes he gets very aggressive..", owner: amanda), Message(text: "Oh God, Amanda, but did he do anything to you?", owner: rachel), Message(text: "No no!!!… but when this happens, he starts yelling at my mom, saying that she doesn’t do anything and she needs to get a job. She is trying, you know? But it is not that easy…. I don’t want to leave her alone and I’m helping her find a job, that's why I'm missing classes so much.", owner: amanda), Message(text: "I see. Amanda, if you get afraid, you can come to my house. Please, count on me!", owner: rachel), Message(text: "Thanks Rach :(", owner: amanda), Message(text: "I'm going to your house 2moro. I can help you and your mom find a job.  I'll bring the copies to you. Ok?  :)", owner: rachel), Message(text: "Ok, thank you!!!", owner: amanda), Message(text: "Thanks Rach!! It was very nice of you coming here to help us. And thanks for the copies too!", owner: amanda), Message(text: "Don’t need to thank me, Mandy. That's what friends are for!!", owner: rachel), Message(text: "Now I feel I can really count on you.", owner: amanda), Message(text: "Sure you can <3", owner: rachel), Message(text: "<3", owner: amanda), Message(text: "Hey, How R U?? Why don’t you come to class? It would be good to you, you'd see your friends…", owner: rachel), Message(text: "Yes, I’ve been thinking of this. I think I’ll go tomorrow!!!!!! ", owner: amanda), Message(text: "GR8!!", owner: rachel), Message(text: "Hey, I'm feeling bad today :/ Are you going to class??", owner: rachel), Message(text: "Yes, I’ll be there today…. Shame we won't meet :(", owner: amanda), Message(text: "GR8 to know you’re going! Welcome back to college!", owner: rachel), Message(text: "Tomorrow we'll see each other.", owner: amanda), Message(text: "Yessss!", owner: rachel), Message(text: "Rachel, I need to talk to you. Are you coming to class today?", owner: amanda), Message(text: "Rachel?", owner: amanda), Message(text: "I don’t know, I'm still feeling bad. I think I’ll stay home today and just go to class tomorrow.", owner: rachel), Message(text: "So I’ll talk to you now.", owner: amanda), Message(text: "Rachel, WHY?", owner: amanda), Message(text: "Why did you tell Lisa about my family problem??", owner: amanda), Message(text: "I trusted you, I opened my house to you. WHY RACHEL?", owner: amanda), Message(text: "Well, I didn't……..", owner: rachel), Message(text: "STOP lying Rachel!!!! I know the thuth!!! Yesterday when you missed class, Lisa told me everything.", owner: amanda), Message(text: "Oh…. Amanda, I'm sorry, I didn’t mean to...", owner: rachel), Message(text: "Oh, you DID Rachel . You DID mean to. I can’t believe that I trusted you!", owner: amanda), Message(text: "It wasn't my intention. Really!", owner: rachel), Message(text: "I can’t believe Rachel, I CANT BELIEVE YOU DID THIS.", owner: amanda), Message(text: "Amanda, come on, this is not a big deal!", owner: rachel), Message(text: "Not a big deal? YOU TOLD LISA THAT MY FATHER BEATS MY MOTHER. THIS IS NOT EVEN TRUE!!! ", owner: amanda), Message(text: "Now my father will never find a job, because of your lies! You lied to me and you lied to Lisa. YOU ARE A LIER, RACHEL.", owner: amanda), Message(text: "I'm not a lier. It's not my fault if your dad is aggressive.", owner: rachel), Message(text: "I can’t believe you are saying this, Rachel. I should've listened to what everybody says…", owner: amanda), Message(text: "What does everybody say?", owner: rachel), Message(text: "That you are a b... , you're evil, Rachel!!! I don’t know how I could trust you.", owner: amanda), Message(text: "I'm what??? Come one, this is just envy. ", owner: rachel), Message(text: "Actually, I don’t give a damn to what you think. I was just trying to help you when I went to your house. YOU told me your sad story. I didnt ask to listen to it. It was not my intention to tell Lisa, it was just a mistake, but after all that, I think you deserved it.", owner: rachel), Message(text: "You really let me down! Don’t you EVER talk to me again, Rachel.", owner: amanda), Message(text: "And remember: What goes around, comes around. ", owner: amanda), Message(text: ":*", owner: rachel), Message(text: "I'm glad you are gone, Rachel.", owner: amanda)]
        
        let lisaMessages = [Message(text: "Hey Lisa! I'll be late today. Can you keep a seat for me by your side, pls?", owner: rachel), Message(text: "Yesss :)", owner: lisa), Message(text: "Listen, Amanda hasn't shown up today again.. I'm worried about her.", owner: lisa), Message(text: "Oh.. She's just having some problems at home. Nothing serious. I mean, kind of...", owner: rachel), Message(text: "Problems? What's going on??", owner: lisa), Message(text: "Opsss.. I wasn’t supposed to tell you that.", owner: rachel), Message(text: "Come on, Rachel. Once you've started, now you finish --'", owner: lisa), Message(text: "Sorry, I can’t.", owner: rachel), Message(text: "Ok. I’ll ask her.", owner: lisa), Message(text: "No, she can’t know that I told you that something is wrong.", owner: rachel), Message(text: "Ok, but now I'm more worried than before.", owner: lisa), Message(text: "Alright, I'll tell you, but promise you won’t tell her that I’ve told you. OK?", owner: rachel), Message(text: "I promise.", owner: lisa), Message(text: "So, her father was fired last month. ", owner: rachel), Message(text: "Because of that, he’s been drinking too much and becoming very aggressive. I think he beats her mother.", owner: rachel), Message(text: "WHAT? This is really serious!", owner: lisa), Message(text: "Sad :(", owner: rachel), Message(text: "She told you that he beats her mom???", owner: lisa), Message(text: "Not in words… but I'm SURE he does!!! I went to her house yesterday and her mom was REALLY down.", owner: rachel), Message(text: "OMG Rachel, we have to go to the police!", owner: lisa), Message(text: "No Lisa, please!!!!! She can’t know that I’ve told you that.", owner: rachel), Message(text: "Ok, I’ll try to know from her.", owner: lisa), Message(text: "I'm almost at college. Let's talk more when I get there.", owner: rachel), Message(text: "Fine.", owner: lisa), Message(text: "ARE YOU STUPID??", owner: rachel), Message(text: "Why did you tell Amanda that I told you!!!!?????", owner: rachel), Message(text: "I was worried Rachel, I really care about Amanda, I needed to talk to her!!!!", owner: lisa), Message(text: "Great, so now our friendship is over because of you!!!!", owner: rachel), Message(text: "No Rachel, you did that. Amanda told me that her father has NEVER beat anyone! You were gossiping about something serious!", owner: lisa), Message(text: "I wasn't gossiping!!!!! I really thought her dad had beat her mom!!!! ", owner: rachel), Message(text: "No one has the right to play with those things. You said that you were SURE about that. I’m really disappointed with you, and so is Amanda.", owner: lisa), Message(text: "You've broken your promise!!! You are a fool, Lisa!!!! Thanks a lot!!!! I’ve lost a friend! I’m SO angry at you, Lisa. YOU DIDNT have the right to end my friendship!!!", owner: rachel), Message(text: "And you didnt have the right to make up stories about serious things!!!! ", owner: lisa), Message(text: "I don’t want to see your stupid face in front of me, Lisa. I'm tired of people like you. Goodbye.", owner: rachel), Message(text: "You should be careful about what you do and say, Rachel. You should be really careful….", owner: lisa), Message(text: "It's been three days since we last talked to each other. I know today is your birthday, but I want to talk to you.", owner: lisa), Message(text: "Im in class. Say it", owner: rachel), Message(text: "No, it must be face to face. Meet me at the basketball court at 10:30 am. ", owner: lisa)]
        
        let joshMessages = [Message(text: "Hey Rachel!", owner: josh), Message(text: "What, Josh?", owner: rachel), Message(text: "Don't be so cold!", owner: josh), Message(text: "Josh, we’re done. I have nothing to talk to you.", owner: rachel), Message(text: "But I do! Me and the horns you got me wearing!", owner: josh), Message(text: "Josh, stop that! I’ve never cheated on you.", owner: rachel), Message(text: "How come you were going out with another guy the day after breaking up with me?!", owner: josh), Message(text: "Josh, you have nothing to do with my life! Not anymore. ", owner: rachel), Message(text: "Why did you leave me, Rachel?", owner: josh), Message(text: "We've already had this conversation. It's over!", owner: rachel), Message(text: "I like you so much…", owner: josh), Message(text: "Josh, it's OVER! Come on, what do you wanna talk to me?", owner: rachel), Message(text: "Are you sure you don’t wanna get back?", owner: josh), Message(text: "…", owner: rachel), Message(text: "Well, you know… I was searching some  images… and I came across some pics...", owner: josh), Message(text: "Which pictures, Josh?!", owner: rachel), Message(text: "Some pics you gave me when we started dating... if you know what I mean.", owner: josh), Message(text: "Do you still have those pictures?!You said you had wiped them out!!!", owner: rachel), Message(text: "I really had. But you know, after you broke up with me, I recovered them. Damn it, how I miss your body!", owner: josh), Message(text: "You are sick, Josh!!!! Go get another girl for you, and PLEASE, wipe out those pictures!!", owner: rachel), Message(text: "Well, I was thinking about doing something else with them…", owner: josh), Message(text: "Arggh, for God sake! What, Josh???", owner: rachel), Message(text: "You know, if you don’t wanna be with me no more, there’s no reason why those pics should belong just to me. I think other people could see them.", owner: josh), Message(text: "Are you threatening me???", owner: rachel), Message(text: "Understand the way you want to.", owner: josh), Message(text: "Are you really gonna be capable of doing something like that to me? After all those years together?!", owner: rachel), Message(text: "You’ve left me Rachel. What can I do?", owner: josh), Message(text: "Act like an adult and move on!!!! ", owner: rachel), Message(text: "You’ve broken my heart.", owner: josh), Message(text: "Forget this crazy idea Josh, please! DELETE THOSE PHOTOS!!!", owner: rachel), Message(text: "We’ve gone through so many incredible moments together! You can't do that to me!", owner: rachel), Message(text: "There’s only one way I won't spread those pics.", owner: josh), Message(text: "What way? Getting back to you?", owner: rachel), Message(text: "Give me one more chance, Rachel!", owner: josh), Message(text: "Josh, I know you. I know you are a good person. The Josh I know would never do something like that. You're good. You're different from me! Please, don’t spoil everything!", owner: rachel), Message(text: "I have no choice.", owner: josh), Message(text: "So guess what? I’m NOT getting back to you! No way!!!! ", owner: rachel), Message(text: "I believe you need to think Rachel. I’ll give you 2 days.", owner: josh), Message(text: "You are playing with fire Josh. It seems you don’t know me.", owner: rachel), Message(text: "And I guess YOU don’t know me. You have two days to decide.", owner: josh), Message(text: "On your birthday, I’ll ask you for an answer. It's your choice: the pictures or me. ", owner: josh), Message(text: "I won’t let you do that Josh! I don’t know what I can do if you spread those photos.", owner: rachel), Message(text: "So now YOU are threatening me?", owner: josh), Message(text: "Understand the way you want to.", owner: rachel), Message(text: "And remember: you know what I’m capable of.", owner: rachel), Message(text: "I’m not afraid of you.", owner: josh), Message(text: "And I’m not afraid of you either.", owner: rachel), Message(text: "In two days, you give me an answer.", owner: josh), Message(text: "I'll give you an answer. If you're still alive.", owner: rachel), Message(text: "So you'll give me an answer. If YOU are still alive!", owner: josh)]
        
        let williamMessages = [Message(text: "Hi, Rachel!", owner: william), Message(text: "Hi, Will!", owner: rachel), Message(text: "How r u?", owner: william), Message(text: "Fine, and U?", owner: rachel), Message(text: "Fine too! Haven’t seen you since you and Josh broke up!!!", owner: william), Message(text: "Listen, you’re not gonna talk about him, r u?", owner: rachel), Message(text: "No, no… he is my bro, but I know you guys are over.", owner: william), Message(text: "Yes.", owner: rachel), Message(text: "What r u doing today?", owner: william), Message(text: "I’m going to college.. after that, I don’t know. ", owner: rachel), Message(text: "Wanna go out with me? Maybe a cinema.", owner: william), Message(text: "Cinema? You and me? Will, you’re very close to Josh. R u crazy?", owner: rachel), Message(text: "Come on, Rachel. I know you. You wouldn’t refuse to go out with an ex-boyfriend's friend… You’re just like me.", owner: william), Message(text: "Maybe. If the guy was gorgeous. That’s not the case here.", owner: rachel), Message(text: "HAHA. I wasn’t going to ask you out. You’re silly, girl! But I changed my mind after I saw some pics of you.", owner: william), Message(text: "Didn’t know you were SO hot.", owner: william), Message(text: "What are you talking about???", owner: rachel), Message(text: "Congrats Rachel! Your body is amazing!", owner: william), Message(text: "I CAN’T BELIEVE JOSH DID THAT. HE’S A JERK. BOTH OF YOU ARE JERKS!!!!", owner: rachel), Message(text: "Calm down baby, He just showed it to me!! And don’t talk to me like that, you are just a b…. ", owner: william), Message(text: "STOP TALKING! ", owner: rachel), Message(text: "This WON'T end up like this...", owner: rachel), Message(text: "Now she’s mad!!!!!!! ", owner: william), Message(text: "Go f* yourself William. I knew you were just like Josh.", owner: rachel), Message(text: "No Rachel, I’m just like YOU.", owner: william)]
        
        let momMessages = [Message(text: "Hey mom, what's for dinner today?", owner: rachel), Message(text: "Hello, dear. I was thinking about ordering a pizza. :)", owner: mom), Message(text: "Cool!", owner: rachel), Message(text: "Are you sure you’re not going to celebrate your birthday?", owner: mom), Message(text: "Yes, I have a test the next day, 21. I may go to a night club with some friends. ", owner: rachel), Message(text: "Alright!", owner: mom), Message(text: "Why r u asking me that?", owner: rachel), Message(text: "Nothing, I just wanted to know.", owner: mom), Message(text: "Ok", owner: rachel), Message(text: "Rachel, is too late. You’ve been out of home since early this morning. Your sister came home at 6 pm. It's 11 p.m now. You have class tomorrow!!!!", owner: mom), Message(text: "Rachel, where are you?", owner: mom), Message(text: "Dear, come home. I'm worried.", owner: mom), Message(text: "I'm going home mom. I'm sorry.", owner: rachel), Message(text: "I’ve spent the day with Peter and Chloe. I’m feeling bad…", owner: rachel), Message(text: "Oh, honey, come home. I’ll prepare you some soup.", owner: mom), Message(text: "Ok, I’m almost home.", owner: rachel),Message(text: "Ok, I'm waiting for you.", owner: mom), Message(text: "Hello, dear. I'm already at work. Are you feeling better?", owner: mom), Message(text: "No, I'm still feeling bad… I think I’ll stay at home today.", owner: rachel), Message(text: "Ok, darling, take some rest. Go back to bed!", owner: mom), Message(text: "I’ll do that.", owner: rachel), Message(text: "Hey, honey, is everything ok? I though you were kind of sad today..", owner: mom), Message(text: "It’s alright mom, it’s alright… don’t worry about me.", owner: rachel), Message(text: "Of course I worry about you!!!! ", owner: mom), Message(text: "Its ok mom.", owner: rachel), Message(text: "I love you!!!!!!!!!!!!!", owner: mom), Message(text: "luv u 2…", owner: rachel), Message(text: "Happy birthday my little angel!!! 18 years old!!! You were the best thing that has ever happened to me! I didn’t see you leaving home today but tonight I’ll kiss you and hug you a lot!!! Love you so much!!!!", owner: mom), Message(text: "And don’t forget to be at home at 6:30p.m. to have dinner with me, your dad and your sister! He's leaving his job earlier because of you! Don’t be late :)", owner: mom), Message(text: "Rach, is 6:45 p.m. Where are you??", owner: mom), Message(text: "Rachel, why don’t you answer the phone?", owner: mom), Message(text: "Rachel, it's 7.00!!!!", owner: mom), Message(text: "Rachel, I’ve called you 5 times, Why don’t you answer me???", owner: mom), Message(text: "RACHEL???? Yesterday you said you'd be here at 6:30. It’s 7:20 now!!!!", owner: mom), Message(text: "Rachel, PLEASE, answer me!!!!!!!!!! I'm really worried!!!!!", owner: mom), Message(text: "RACHEL!?!?!?!?!??!?!?!", owner: mom), Message(text: "Rachel, we have prepared you a surprise party!!! Everybody is here to see you!!!! WHERE ARE YOU??", owner: mom), Message(text: "They’re saying you left college earlier! WHERE ARE YOU??", owner: mom), Message(text: "I’ve called you 50 times already!!! It's 8pm!! Everybody is leaving!!!", owner: mom), Message(text: "Rachel, please, come home!", owner: mom), Message(text: "I’m calling 911.", owner: mom)]
        
        let annieMessages = [Message(text: "Hey sister, what’s your credit card password?", owner: annie), Message(text: "Guess kk", owner: rachel), Message(text: "It’s serious… Wasn’t it 1984, as the title of the book you love?", owner: annie), Message(text: "Right!", owner: rachel), Message(text: "Did you change it?", owner: annie), Message(text: "Yep!", owner: rachel), Message(text: "And…….?", owner: annie), Message(text: "I started to read new things.", owner: rachel), Message(text: "Oh, ok", owner: annie), Message(text: "Hey", owner: annie), Message(text: "Are you really gonna disappear when we prepare you a surprise party?", owner: annie), Message(text: "Rachel!??!", owner: annie), Message(text: "People are leaving!!!!", owner: annie), Message(text: "Nice… Happy Birthday.", owner: annie), Message(text: "Where are you??????", owner: annie), Message(text: "Rachel, srsly mom and dad are worried!!!", owner: annie), Message(text: "Rachel is gone", owner: rachel)]
        
        //LISTA DE CONVERSAS
        talkList.append(Talk(remetente: annie, messsageList: annieMessages))
        talkList.append(Talk(remetente: mom, messsageList: momMessages))
        talkList.append(Talk(remetente: amanda, messsageList: amandaMessages))
        talkList.append(Talk(remetente: lisa, messsageList: lisaMessages))
        talkList.append(Talk(remetente: josh, messsageList: joshMessages))
        talkList.append(Talk(remetente: william, messsageList: williamMessages))
       
      
        
        
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
        //cell.lastMessageLabel.text = "last message"
        //cell.dayLabel.text = "domingo"
        //cell.pinImage.image = UIImage(named: "pin")
          
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
