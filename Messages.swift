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
        let mom = Person(name: NSLocalizedString("Mom", comment: "Mom"))
        let annie = Person(name: "Annie")
        let stranger = Person(name: "1-801-877-9393")
        let strangerTwo = Person(name: "1-801-255-7800")
        
        let t1 = NSLocalizedString("Hey Rach... Are you going to class today?", comment: "Hey Rach... Are you going to class today?")
        let t2 = NSLocalizedString("Yep!! R U? Why are you missing classes so much?", comment: "Yep!! R U? Why are you missing classes so much?")
        let t3 = NSLocalizedString("I'm not going today again...I was going to ask if I can copy your notes later… I have some issues at home… ", comment: "I'm not going today again...I was going to ask if I can copy your notes later… I have some issues at home… ")
        let t4 = NSLocalizedString("Of course! What happened, Mandy?  😢", comment: "Of course! What happened, Mandy?  😢")
        let t5 = NSLocalizedString("Promise you won’t tell anyone about this…", comment: "Promise you won’t tell anyone about this…")
        let t6 = NSLocalizedString("Of course I won’t!!!! You are my BFF!!!!👯", comment: "Of course I won’t!!!! You are my BFF!!!!👯")
        let t7 = NSLocalizedString( "It's serious Rach... Can I count on you? I really need a friend at this moment.. I'd rather to tell you face to face but I'm not in the mood to go out..", comment:  "It's serious Rach... Can I count on you? I really need a friend at this moment.. I'd rather to tell you face to face but I'm not in the mood to go out..")
        let t8 = NSLocalizedString("Yes Amanda, you can count on me. I won’t tell anyone.", comment: "Yes Amanda, you can count on me. I won’t tell anyone.")
        let t9 = NSLocalizedString("Sorry, I fell asleep. Ok, well… My father got fired last month. He had been working in this company for 30 years.", comment:"Sorry, I fell asleep. Ok, well… My father got fired last month. He had been working in this company for 30 years.")
        let t10 = NSLocalizedString("OMG, Amanda, I'm so sorry :( I didn’t know.. He had an important position, didn't he?", comment: "OMG, Amanda, I'm so sorry :( I didn’t know.. He had an important position, didn't he?")
        let t11 = NSLocalizedString(
            "Yes… And my mom stopped working when she got pregnant of my little sister. So now things are terrible. I had to quit my painting classes and my sister had to quit ballet to save money. My father and mother are looking for a job desperately.", comment:
            "Yes… And my mom stopped working when she got pregnant of my little sister. So now things are terrible. I had to quit my painting classes and my sister had to quit ballet to save money. My father and mother are looking for a job desperately.")
        let t12 = NSLocalizedString("Oh Amanda, I can imagine how you feel, but things will get better. Why didn’t you tell me before? ", comment: "Oh Amanda, I can imagine how you feel, but things will get better. Why didn’t you tell me before? ")
        let t13 = NSLocalizedString("Cause it’s been very difficult to me. And this is not the worst thing…", comment: "Cause it’s been very difficult to me. And this is not the worst thing…")
        let t14 = NSLocalizedString("Not the worst thing?", comment: "Not the worst thing?")
        let t15 = NSLocalizedString("My father has been drinking too much… When he drinks, he gets very moody. Sometimes he cries a lot and sometimes he gets very aggressive..", comment: "My father has been drinking too much… When he drinks, he gets very moody. Sometimes he cries a lot and sometimes he gets very aggressive..")
        let t16 = NSLocalizedString("Oh God, Amanda, but did he do anything to you?", comment: "Oh God, Amanda, but did he do anything to you?")
        let t17 = NSLocalizedString( "No no!!!… but when this happens, he starts yelling at my mom, saying that she doesn’t do anything and she needs to get a job. She is trying, you know? But it is not that easy…. I don’t want to leave her alone and I’m helping her find a job, that's why I'm missing classes so much.", comment: "No no!!!… but when this happens, he starts yelling at my mom, saying that she doesn’t do anything and she needs to get a job. She is trying, you know? But it is not that easy…. I don’t want to leave her alone and I’m helping her find a job, that's why I'm missing classes so much.")
        let t18 = NSLocalizedString("I see. Amanda, if you get afraid, you can come to my house. Please, count on me!", comment: "I see. Amanda, if you get afraid, you can come to my house. Please, count on me!")
        let t19 = NSLocalizedString("Thanks Rach :(", comment: "Thanks Rach :(")
        let t20 = NSLocalizedString("I'm going to your house 2moro. I can help you and your mom find a job.  I'll bring the copies to you. Ok?  :)", comment: "I'm going to your house 2moro. I can help you and your mom find a job.  I'll bring the copies to you. Ok?  :)")
        let t21 = NSLocalizedString("Ok, thank you!!!" , comment: "Ok, thank you!!!" )
        let t22 = NSLocalizedString("Thanks Rach!! It was very nice of you coming here to help us. And thanks for the copies too!", comment: "Thanks Rach!! It was very nice of you coming here to help us. And thanks for the copies too!")
        let t23 = NSLocalizedString("Don’t need to thank me, Mandy. That's what friends are for!!", comment: "Don’t need to thank me, Mandy. That's what friends are for!!")
        let t24 = NSLocalizedString( "Now I feel I can really count on you.", comment: "Now I feel I can really count on you.")
        let t25 = NSLocalizedString("Sure you can ❤️", comment: "Sure you can ❤️")
        let t26 = NSLocalizedString("Hey, How R U?? Why don’t you come to class? It would be good to you, you'd see your friends…", comment: "Hey, How R U?? Why don’t you come to class? It would be good to you, you'd see your friends…")
        let t27 = NSLocalizedString("Yes, I’ve been thinking of this. I think I’ll go tomorrow!!!!!! " , comment: "Yes, I’ve been thinking of this. I think I’ll go tomorrow!!!!!! " )
        let t28 = NSLocalizedString("Hey, I'm feeling bad today 😣 Are you going to class??", comment: "Hey, I'm feeling bad today 😣 Are you going to class??")
        let t29 = NSLocalizedString("Yes, I’ll be there today…. Shame we won't meet :(", comment: "Yes, I’ll be there today…. Shame we won't meet :(")
        let t30 = NSLocalizedString("GR8 to know you’re going! Welcome back to college!", comment: "GR8 to know you’re going! Welcome back to college!")
        let t31 = NSLocalizedString("Tomorrow we'll see each other.", comment: "Tomorrow we'll see each other.")
        let t32 = NSLocalizedString("Yessss!", comment: "Yessss!")
        let t33 = NSLocalizedString("Rachel, I need to talk to you. Are you coming to class today?", comment: "Rachel, I need to talk to you. Are you coming to class today?")
        let t34 = NSLocalizedString( "I don’t know, I'm still feeling bad. I think I’ll stay home today and just go to class tomorrow.", comment:  "I don’t know, I'm still feeling bad. I think I’ll stay home today and just go to class tomorrow.")
        let t35 = NSLocalizedString("So I’ll talk to you now.", comment: "So I’ll talk to you now.")
        let t36 = NSLocalizedString("Rachel, WHY?", comment: "Rachel, WHY?")
        let t37 = NSLocalizedString("Why did you tell Lisa about my family problem??", comment: "Why did you tell Lisa about my family problem??")
        let t38 = NSLocalizedString("I trusted you, I opened my house to you. WHY RACHEL?", comment: "I trusted you, I opened my house to you. WHY RACHEL?")
        let t39 = NSLocalizedString("Well, I didn't…….." , comment: "Well, I didn't…….." )
        let t40 = NSLocalizedString("STOP lying Rachel!!!! I know the thuth!!! Yesterday when you missed class, Lisa told me everything.", comment: "STOP lying Rachel!!!! I know the thuth!!! Yesterday when you missed class, Lisa told me everything.")
        let t41 = NSLocalizedString(  "Oh…. Amanda, I'm sorry, I didn’t mean to..." , comment:   "Oh…. Amanda, I'm sorry, I didn’t mean to..." )
        let t42 = NSLocalizedString( "Oh, you DID Rachel . You DID mean to. I can’t believe that I trusted you!", comment:  "Oh, you DID Rachel . You DID mean to. I can’t believe that I trusted you!")
        let t43 = NSLocalizedString( "It wasn't my intention. Really!" , comment:  "It wasn't my intention. Really!" )
        let t44 = NSLocalizedString("I can’t believe Rachel, I CANT BELIEVE YOU DID THIS.", comment: "I can’t believe Rachel, I CANT BELIEVE YOU DID THIS.")
        let t45 = NSLocalizedString("Now my father will never find a job, because of your lies! You lied to me and you lied to Lisa. YOU ARE A LIAR, RACHEL.", comment: "Now my father will never find a job, because of your lies! You lied to me and you lied to Lisa. YOU ARE A LIAR, RACHEL.")
        let t46 = NSLocalizedString("I'm not a liar. It's not my fault if your dad is aggressive.", comment: "I'm not a liar. It's not my fault if your dad is aggressive.")
        let t47 = NSLocalizedString("I can’t believe you are saying this, Rachel. I should've listened to what everybody says…", comment: "I can’t believe you are saying this, Rachel. I should've listened to what everybody says…")
        let t48 = NSLocalizedString("What does everybody say?", comment: "What does everybody say?")
        let t49 = NSLocalizedString("That you are a b... , you're evil, Rachel!!! I don’t know how I could trust you.", comment: "That you are a b... , you're evil, Rachel!!! I don’t know how I could trust you.")
        let t50 = NSLocalizedString("I'm what??? Come on, this is just envy 😘 ", comment: "I'm what??? Come on, this is just envy 😘 ")
        let t51 = NSLocalizedString("Actually, I don’t give a damn to what you think. I was just trying to help you when I went to your house. YOU told me your sad story. I didnt ask to listen to it. It was not my intention to tell Lisa, it was just a mistake, but after all that, I think you deserved it.", comment: "Actually, I don’t give a damn to what you think. I was just trying to help you when I went to your house. YOU told me your sad story. I didnt ask to listen to it. It was not my intention to tell Lisa, it was just a mistake, but after all that, I think you deserved it.")
        let t52 = NSLocalizedString("You really let me down! Don’t you EVER talk to me again, Rachel.", comment: "You really let me down! Don’t you EVER talk to me again, Rachel.")
        let t53 = NSLocalizedString("And remember: What goes around, comes around. ", comment: "And remember: What goes around, comes around. ")
        let t54 = NSLocalizedString("I'm glad you are gone, Rachel.", comment: "I'm glad you are gone, Rachel.")
        
        
        
        let t55 = NSLocalizedString("Hey Lisa! I'll be late today. Can you keep a seat for me by your side, pls? ", comment: "Hey Lisa! I'll be late today. Can you keep a seat for me by your side, pls? ")
        let t56 = NSLocalizedString("Yesss :)", comment: "Yesss :)")
        let t57 = NSLocalizedString("Listen, Amanda hasn't shown up today again.. I'm worried about her.", comment: "Listen, Amanda hasn't shown up today again.. I'm worried about her.")
        let t58 = NSLocalizedString("Oh.. She's just having some problems at home. Nothing serious. I mean, kind of...", comment: "Oh.. She's just having some problems at home. Nothing serious. I mean, kind of...")
        let t59 = NSLocalizedString("Problems? What's going on??" , comment: "Problems? What's going on??" )
        let t60 = NSLocalizedString("Opsss.. I wasn’t supposed to tell you that.", comment: "Opsss.. I wasn’t supposed to tell you that.")
        let t61 = NSLocalizedString("Come on, Rachel. Once you've started, now you finish --'", comment: "Come on, Rachel. Once you've started, now you finish --'")
        let t62 = NSLocalizedString("Sorry, I can’t.", comment: "Sorry, I can’t.")
        let t63 = NSLocalizedString("Ok. I’ll ask her.", comment: "Ok. I’ll ask her.")
        let t64 = NSLocalizedString("No, she can’t know that I told you that something is wrong.", comment: "No, she can’t know that I told you that something is wrong.")
        let t65 = NSLocalizedString("Ok, but now I'm more worried than before.", comment: "Ok, but now I'm more worried than before.")
        let t66 = NSLocalizedString("Alright, I'll tell you, but promise you won’t tell her that I’ve told you. OK?", comment: "Alright, I'll tell you, but promise you won’t tell her that I’ve told you. OK?")
        let t67 = NSLocalizedString("I promise.", comment: "I promise.")
        let t68 = NSLocalizedString("So, her father was fired last month. ", comment: "So, her father was fired last month. ")
        let t69 = NSLocalizedString( "Because of that, he’s been drinking too much and becoming very aggressive. I think he beats her mother.", comment:  "Because of that, he’s been drinking too much and becoming very aggressive. I think he beats her mother.")
        let t70 = NSLocalizedString("WHAT? This is really serious!", comment: "WHAT? This is really serious!")
        let t71 = NSLocalizedString("Sad :(", comment: "Sad :(")
        let t72 = NSLocalizedString("She told you that he beats her mom???" , comment: "She told you that he beats her mom???" )
        let t73 = NSLocalizedString("Not in words… but I'm SURE he does!!! I went to her house yesterday and her mom was REALLY down.", comment: "Not in words… but I'm SURE he does!!! I went to her house yesterday and her mom was REALLY down.")
        let t74 = NSLocalizedString("OMG Rachel, we have to go to the police!" , comment: "OMG Rachel, we have to go to the police!" )
        let t75 = NSLocalizedString("No Lisa, please!!!!! She can’t know that I’ve told you that.", comment: "No Lisa, please!!!!! She can’t know that I’ve told you that.")
        let t76 = NSLocalizedString("Ok, I’ll try to know from her.", comment: "Ok, I’ll try to know from her.")
        let t77 = NSLocalizedString("I'm almost at college. Let's talk more when I get there." , comment: "I'm almost at college. Let's talk more when I get there." )
        let t78 = NSLocalizedString("ARE YOU STUPID??", comment: "ARE YOU STUPID??")
        let t79 = NSLocalizedString("Why did you tell Amanda that I told you!!!!?????", comment: "Why did you tell Amanda that I told you!!!!?????")
        let t80 = NSLocalizedString("I was worried Rachel, I really care about Amanda, I needed to talk to her!!!!", comment: "I was worried Rachel, I really care about Amanda, I needed to talk to her!!!!")
        let t81 = NSLocalizedString("Great, so now our friendship is over because of you!!!!", comment:"Great, so now our friendship is over because of you!!!!")
        let t82 = NSLocalizedString("No Rachel, you did that. Amanda told me that her father has NEVER beat anyone! You were gossiping about something serious!", comment: "No Rachel, you did that. Amanda told me that her father has NEVER beat anyone! You were gossiping about something serious!")
        let t83 = NSLocalizedString("I wasn't gossiping!!!!! I really thought her dad had beat her mom!!!! ", comment: "I wasn't gossiping!!!!! I really thought her dad had beat her mom!!!! ")
        let t84 = NSLocalizedString("No one has the right to play with those things. You said that you were SURE about that. I’m really disappointed with you, and so is Amanda.", comment: "No one has the right to play with those things. You said that you were SURE about that. I’m really disappointed with you, and so is Amanda.")
        let t85 = NSLocalizedString("You've broken your promise!!! You are a fool, Lisa!!!! Thanks a lot!!!! I’ve lost a friend! I’m SO angry at you, Lisa. YOU DIDNT have the right to end my friendship!!!", comment: "You've broken your promise!!! You are a fool, Lisa!!!! Thanks a lot!!!! I’ve lost a friend! I’m SO angry at you, Lisa. YOU DIDNT have the right to end my friendship!!!")
        let t86 = NSLocalizedString("And you didnt have the right to make up stories about serious things!!!! " , comment: "And you didnt have the right to make up stories about serious things!!!! " )
        let t87 = NSLocalizedString("I don’t want to see your stupid face in front of me, Lisa. I'm tired of people like you. Goodbye.", comment: "I don’t want to see your stupid face in front of me, Lisa. I'm tired of people like you. Goodbye.")
        let t88 = NSLocalizedString("You should be careful about what you do and say, Rachel. You should be really careful…." , comment: "You should be careful about what you do and say, Rachel. You should be really careful…." )
        let t89 = NSLocalizedString("It's been three days since we last talked to each other. I know today is your birthday, but I want to talk to you.", comment: "It's been three days since we last talked to each other. I know today is your birthday, but I want to talk to you.")
        let t90 = NSLocalizedString("Im in class. Say it" , comment: "Im in class. Say it" )
        let t91 = NSLocalizedString("No, it must be face to face. Meet me at the basketball court at 10:30 am. ", comment: "No, it must be face to face. Meet me at the basketball court at 10:30 am. ")
        
        
        
        let t92 = NSLocalizedString("Hey Rachel!", comment: "Hey Rachel!")
        let t93 = NSLocalizedString("What, Josh?", comment: "What, Josh?")
        let t94 = NSLocalizedString( "Don't be so cold!", comment:  "Don't be so cold!")
        let t95 = NSLocalizedString("Josh, we’re done. I have nothing to talk to you.", comment: "Josh, we’re done. I have nothing to talk to you.")
        let t96 = NSLocalizedString("But I do!i want explanations!!", comment:"But I do!i want explanations!!")
        let t97 = NSLocalizedString("Josh, stop that! I’ve never cheated on you.", comment: "Josh, stop that! I’ve never cheated on you.")
        let t98 = NSLocalizedString("How come you were going out with another guy the day after breaking up with me?!" , comment:"How come you were going out with another guy the day after breaking up with me?!" )

        let t99 = NSLocalizedString("Josh, you have nothing to do with my life! Not anymore. " , comment: "Josh, you have nothing to do with my life! Not anymore. " )
        let t100 = NSLocalizedString( "Why did you leave me, Rachel?", comment: "Why did you leave me, Rachel?")
        let t101 = NSLocalizedString( "We've already had this conversation. It's over!", comment:  "We've already had this conversation. It's over!")
        let t102 = NSLocalizedString("I like you so much…", comment: "I like you so much…")
        let t103 = NSLocalizedString("Josh, it's OVER! Come on, what do you wanna talk to me?", comment: "Josh, it's OVER! Come on, what do you wanna talk to me?")
        let t104 = NSLocalizedString("Are you sure you don’t wanna get back?", comment: "Are you sure you don’t wanna get back?")
        let t105 = NSLocalizedString("Well, you know… I was searching some  images… and I came across some pics..." , comment: "Well, you know… I was searching some  images… and I came across some pics..." )
        let t106 = NSLocalizedString( "Which pictures, Josh?!" , comment:  "Which pictures, Josh?!" )
        let t107 = NSLocalizedString("Some pics you gave me when we started dating... if you know what I mean.", comment: "Some pics you gave me when we started dating... if you know what I mean.")
        let t108 = NSLocalizedString("Do you still have those pictures?!You said you had wiped them out!!!", comment:"Do you still have those pictures?!You said you had wiped them out!!!")
        let t109 = NSLocalizedString( "I really had. But you know, after you broke up with me, I recovered them. Damn it, how I miss your body!", comment:  "I really had. But you know, after you broke up with me, I recovered them. Damn it, how I miss your body!")
        let t110 = NSLocalizedString("You are sick, Josh!!!! Go get another girl for you, and PLEASE, wipe out those pictures!!", comment: "You are sick, Josh!!!! Go get another girl for you, and PLEASE, wipe out those pictures!!")
        let t111 = NSLocalizedString("Well, I was thinking about doing something else with them…" , comment:"Well, I was thinking about doing something else with them…" )
        let t112 = NSLocalizedString("Arggh, for God sake! What, Josh???", comment: "Arggh, for God sake! What, Josh???")
        let t113 = NSLocalizedString("You know, if you don’t wanna be with me no more, there’s no reason why those pics should belong just to me. I think other people could see them.", comment: "You know, if you don’t wanna be with me no more, there’s no reason why those pics should belong just to me. I think other people could see them.")
        let t114 = NSLocalizedString("Are you threatening me???", comment: "Are you threatening me???")
        let t115 = NSLocalizedString("Understand the way you want to.", comment: "Understand the way you want to.")
        let t116 = NSLocalizedString("Are you really gonna be capable of doing something like that to me? After all those years together?!" , comment: "Are you really gonna be capable of doing something like that to me? After all those years together?!" )
        let t117 = NSLocalizedString("You’ve left me Rachel. What can I do?", comment: "You’ve left me Rachel. What can I do?")
        let t118 = NSLocalizedString("Act like an adult and move on!!!! ", comment: "Act like an adult and move on!!!! ")
        let t119 = NSLocalizedString( "You’ve broken my heart.", comment: "You’ve broken my heart.")
        let t120 = NSLocalizedString("Forget this crazy idea Josh, please! DELETE THOSE PHOTOS!!!" , comment: "Forget this crazy idea Josh, please! DELETE THOSE PHOTOS!!!" )
        let t121 = NSLocalizedString("We’ve gone through so many incredible moments together! You can't do that to me!", comment: "We’ve gone through so many incredible moments together! You can't do that to me!")
        let t122 = NSLocalizedString("There’s only one way I won't spread those pics.", comment: "There’s only one way I won't spread those pics.")
        let t123 = NSLocalizedString("What way? Getting back to you?", comment: "What way? Getting back to you?")
        let t124 = NSLocalizedString("Give me one more chance, Rachel!", comment: "Give me one more chance, Rachel!")
        let t125 = NSLocalizedString("Josh, I know you. I know you are a good person. The Josh I know would never do something like that. You're good. You're different from me! Please, don’t spoil everything!" , comment: "Josh, I know you. I know you are a good person. The Josh I know would never do something like that. You're good. You're different from me! Please, don’t spoil everything!" )
        let t126 = NSLocalizedString("I have no choice." , comment: "I have no choice." )
        let t127 = NSLocalizedString("So guess what? I’m NOT getting back to you! No way!!!! ", comment: "So guess what? I’m NOT getting back to you! No way!!!! ")
        let t128 = NSLocalizedString("I believe you need to think Rachel. I’ll give you 2 days.", comment: "I believe you need to think Rachel. I’ll give you 2 days.")
        let t129 = NSLocalizedString("You are playing with fire Josh. It seems you don’t know me.", comment: "You are playing with fire Josh. It seems you don’t know me.")
        let t130 = NSLocalizedString("And I guess YOU don’t know me. You have two days to decide.", comment: "And I guess YOU don’t know me. You have two days to decide.")
        let t131 = NSLocalizedString("On your birthday, I’ll ask you for an answer. It's your choice: the pictures or me. ", comment: "On your birthday, I’ll ask you for an answer. It's your choice: the pictures or me. ")
        let t132 = NSLocalizedString("I won’t let you do that Josh! I don’t know what I can do if you spread those photos.", comment: "I won’t let you do that Josh! I don’t know what I can do if you spread those photos.")
        let t133 = NSLocalizedString( "So now YOU are threatening me?" , comment:  "So now YOU are threatening me?" )
        let t134 = NSLocalizedString("Understand the way you want to.", comment: "Understand the way you want to.")
        let t135 = NSLocalizedString("And remember: you know what I’m capable of.", comment: "And remember: you know what I’m capable of.")
        let t136 = NSLocalizedString("I’m not afraid of you.", comment: "I’m not afraid of you.")
        let t137 = NSLocalizedString("And I’m not afraid of you either.", comment: "And I’m not afraid of you either.")
        let t138 = NSLocalizedString("In two days, you give me an answer.", comment: "In two days, you give me an answer.")
        let t139 = NSLocalizedString("I'll give you an answer. If you're still alive.", comment: "I'll give you an answer. If you're still alive.")
        
        
        let t140 = NSLocalizedString("Hi, Rachel!", comment: "Hi, Rachel!")
        let t141 = NSLocalizedString("Hi, Will!", comment: "Hi, Will!")
        let t142 = NSLocalizedString("How r u?", comment: "How r u?")
        let t143 = NSLocalizedString("Fine, and U?", comment: "Fine, and U?")
        let t144 = NSLocalizedString("Fine too! Haven’t seen you since you and Josh broke up!!!", comment: "Fine too! Haven’t seen you since you and Josh broke up!!!")
        let t145 = NSLocalizedString("Listen, you’re not gonna talk about him, r u?", comment: "Listen, you’re not gonna talk about him, r u?")
        let t146 = NSLocalizedString("No, no… he is my bro, but I know you guys are over.", comment: "No, no… he is my bro, but I know you guys are over.")
        let t147 = NSLocalizedString("Yes.", comment: "Yes.")
        let t148 = NSLocalizedString("What r u doing today?", comment: "What r u doing today?")
        let t149 = NSLocalizedString("I’m going to college.. after that, I don’t know. ", comment: "I’m going to college.. after that, I don’t know. ")
        let t150 = NSLocalizedString("Wanna go out with me? Maybe a cinema." , comment: "Wanna go out with me? Maybe a cinema." )
        let t151 = NSLocalizedString("Cinema? You and me? Will, you’re very close to Josh. R u crazy?", comment: "Cinema? You and me? Will, you’re very close to Josh. R u crazy?")
        let t152 = NSLocalizedString("Come on, Rachel. I know you. You wouldn’t refuse to go out with an ex-boyfriend's friend… You’re just like me.", comment: "Come on, Rachel. I know you. You wouldn’t refuse to go out with an ex-boyfriend's friend… You’re just like me.")
        let t153 = NSLocalizedString("Maybe. If the guy was gorgeous. That’s not the case here.", comment: "Maybe. If the guy was gorgeous. That’s not the case here.")
        let t154 = NSLocalizedString("HAHA. I wasn’t going to ask you out. You’re silly, girl! But I changed my mind after I saw some pics of you." , comment: "HAHA. I wasn’t going to ask you out. You’re silly, girl! But I changed my mind after I saw some pics of you." )
        let t155 = NSLocalizedString( "Didn’t know you were SO hot. 👅", comment:  "Didn’t know you were SO hot. 👅")
        let t156 = NSLocalizedString("What are you talking about???", comment: "What are you talking about???")
        let t157 = NSLocalizedString("I CAN’T BELIEVE JOSH DID THAT. HE’S A JERK. BOTH OF YOU ARE JERKS!!!!", comment: "I CAN’T BELIEVE JOSH DID THAT. HE’S A JERK. BOTH OF YOU ARE JERKS!!!!")
        let t158 = NSLocalizedString("Calm down baby, He just showed it to me!! And don’t talk to me like that, you are just a b…. ", comment: "Calm down baby, He just showed it to me!! And don’t talk to me like that, you are just a b…. ")
        let t159 = NSLocalizedString("STOP TALKING! ", comment: "STOP TALKING! ")
        let t160 = NSLocalizedString("This WON'T end up like this...", comment: "This WON'T end up like this...")
        let t161 = NSLocalizedString("Now she’s mad!!!!!!! ", comment: "Now she’s mad!!!!!!! ")
        let t162 = NSLocalizedString("Go f* yourself William. I knew you were just like Josh.", comment: "Go f* yourself William. I knew you were just like Josh.")
        let t163 = NSLocalizedString("No Rachel, I’m just like YOU.", comment:"No Rachel, I’m just like YOU.")
        let t164 = NSLocalizedString( "Hey mom, what's for dinner today?" , comment:  "Hey mom, what's for dinner today?" )
        let t165 = NSLocalizedString("Hello, dear. I was thinking about ordering a pizza. :)" , comment: "Hello, dear. I was thinking about ordering a pizza. :)" )
        let t166 = NSLocalizedString( "Cool!" , comment:  "Cool!" )
        let t167 = NSLocalizedString("Are you sure you’re not going to celebrate your birthday?", comment: "Are you sure you’re not going to celebrate your birthday?")
        let t168 = NSLocalizedString("Yes, I have a test the next day, 21. I may go to a night club with some friends. ", comment: "Yes, I have a test the next day, 21. I may go to a night club with some friends. ")
        let t169 = NSLocalizedString( "Alright!", comment:  "Alright!")
        let t170 = NSLocalizedString("Why r u asking me that?" , comment: "Why r u asking me that?" )
        let t171 = NSLocalizedString("Nothing, I just wanted to know.", comment: "Nothing, I just wanted to know.")
        let t172 = NSLocalizedString( "Rachel, is too late. You’ve been out of home since early this morning. Your sister came home at 6 pm. It's 11 p.m now. You have class tomorrow!!!!" , comment:  "Rachel, is too late. You’ve been out of home since early this morning. Your sister came home at 6 pm. It's 11 p.m now. You have class tomorrow!!!!" )
        let t173 = NSLocalizedString("Rachel, where are you?", comment: "Rachel, where are you?")
        let t174 = NSLocalizedString("Dear, come home. I'm worried.", comment: "Dear, come home. I'm worried.")
        let t175 = NSLocalizedString("I'm going home mom. I'm sorry.", comment: "I'm going home mom. I'm sorry.")
        let t176 = NSLocalizedString("I’ve spent the day with Peter and Chloe. I’m feeling bad…" , comment: "I’ve spent the day with Peter and Chloe. I’m feeling bad…" )
        let t177 = NSLocalizedString("Oh, honey, come home. I’ll prepare you some soup.", comment: "Oh, honey, come home. I’ll prepare you some soup.")
        let t178 = NSLocalizedString("Ok, I’m almost home.", comment: "Ok, I’m almost home.")
        let t179 = NSLocalizedString("Ok, I'm waiting for you." , comment: "Ok, I'm waiting for you." )
        let t180 = NSLocalizedString("Hello, dear. I'm already at work. Are you feeling better?", comment: "Hello, dear. I'm already at work. Are you feeling better?")
        let t181 = NSLocalizedString("No, I'm still feeling bad… I think I’ll stay at home today.", comment: "No, I'm still feeling bad… I think I’ll stay at home today.")
        let t182 = NSLocalizedString("Ok, darling, take some rest. Go back to bed!", comment: "Ok, darling, take some rest. Go back to bed!")
        let t183 = NSLocalizedString("I’ll do that.", comment: "I’ll do that.")
        let t184 = NSLocalizedString("Ok, I'm waiting for you.", comment: "Ok, I'm waiting for you.")
        let t185 = NSLocalizedString("Hello, dear. I'm already at work. Are you feeling better?", comment: "Hello, dear. I'm already at work. Are you feeling better?")
        let t186 = NSLocalizedString("No, I'm still feeling bad… I think I’ll stay at home today.", comment: "No, I'm still feeling bad… I think I’ll stay at home today.")
        let t187 = NSLocalizedString("Ok, darling, take some rest. Go back to bed!", comment: "Ok, darling, take some rest. Go back to bed!")
        let t188 = NSLocalizedString("I’ll do that." , comment:  "I’ll do that.")
        let t189 = NSLocalizedString("Hey, honey, is everything ok? I though you were kind of sad today..", comment: "Hey, honey, is everything ok? I though you were kind of sad today..")
        let t190 = NSLocalizedString("It’s alright mom, it’s alright… don’t worry about me.", comment: "It’s alright mom, it’s alright… don’t worry about me.")
        let t191 = NSLocalizedString( "Of course I worry about you!!!! " , comment:  "Of course I worry about you!!!! " )
        let t192 = NSLocalizedString("Its ok mom.", comment: "Its ok mom.")
        let t193 = NSLocalizedString("I love you!!!!!!!!!!!!!", comment: "I love you!!!!!!!!!!!!!")
        let t194 = NSLocalizedString("luv u 2…" , comment: "luv u 2…" )
        let t195 = NSLocalizedString("Happy birthday my little angel!!! 18 years old!!! You were the best thing that has ever happened to me! I didn’t see you leaving home today but tonight I’ll kiss you and hug you a lot!!! Love you so much!!!!", comment: "Happy birthday my little angel!!! 18 years old!!! You were the best thing that has ever happened to me! I didn’t see you leaving home today but tonight I’ll kiss you and hug you a lot!!! Love you so much!!!!")
        let t196 = NSLocalizedString("And don’t forget to be at home at 6:30p.m. to have dinner with me, your dad and your sister! He's leaving his job earlier because of you! Don’t be late :)" , comment: "And don’t forget to be at home at 6:30p.m. to have dinner with me, your dad and your sister! He's leaving his job earlier because of you! Don’t be late :)" )
        let t197 = NSLocalizedString("Rach, is 6:45 p.m. Where are you??" , comment: "Rach, is 6:45 p.m. Where are you??" )
        let t198 = NSLocalizedString("Rachel, why don’t you answer the phone?", comment: "Rachel, why don’t you answer the phone?")
        let t199 = NSLocalizedString( "Rachel, it's 7.00!!!!", comment:  "Rachel, it's 7.00!!!!")
        let t200 = NSLocalizedString( "Rachel, I’ve called you 5 times, Why don’t you answer me???" , comment:  "Rachel, I’ve called you 5 times, Why don’t you answer me???" )
        let t201 = NSLocalizedString("RACHEL???? Yesterday you said you'd be here at 6:30. It’s 7:20 now!!!!" , comment: "RACHEL???? Yesterday you said you'd be here at 6:30. It’s 7:20 now!!!!" )
        let t202 = NSLocalizedString( "Rachel, PLEASE, answer me!!!!!!!!!! I'm really worried!!!!!" , comment:  "Rachel, PLEASE, answer me!!!!!!!!!! I'm really worried!!!!!" )
        let t203 = NSLocalizedString("Rachel, we have prepared you a surprise party!!! Everybody is here to see you!!!! WHERE ARE YOU??", comment: "Rachel, we have prepared you a surprise party!!! Everybody is here to see you!!!! WHERE ARE YOU??")
        let t204 = NSLocalizedString("They’re saying you left college earlier! WHERE ARE YOU??", comment: "They’re saying you left college earlier! WHERE ARE YOU??")
        let t205 = NSLocalizedString("I’ve called you 50 times already!!! It's 8pm!! Everybody is leaving!!!", comment: "I’ve called you 50 times already!!! It's 8pm!! Everybody is leaving!!!")
        let t206 = NSLocalizedString("Rachel, please, come home!" , comment: "Rachel, please, come home!" )
        let t207 = NSLocalizedString("I’m calling 911.", comment: "I’m calling 911.")
        let t208 = NSLocalizedString( "Hey sister, what’s your credit card password?", comment: "Hey sister, what’s your credit card password?")
        let t209 = NSLocalizedString("It’s serious… Wasn’t it 1984, as the title of the book you love?", comment: "It’s serious… Wasn’t it 1984, as the title of the book you love?")
        let t210 = NSLocalizedString("Right!", comment: "Right!")
        let t211 = NSLocalizedString("Did you change it?", comment: "Did you change it?")
        let t212 = NSLocalizedString("Yep!", comment:"Yep!")
        let t213 = NSLocalizedString("And…….?", comment: "And…….?")
        let t214 = NSLocalizedString("I started to read new things.", comment: "I started to read new things.")
        let t215 = NSLocalizedString("Are you really gonna disappear when we prepare you a surprise party?", comment: "Are you really gonna disappear when we prepare you a surprise party?")
        let t216 = NSLocalizedString("People are leaving!!!!", comment: "People are leaving!!!!")
        let t217 = NSLocalizedString("Nice… Happy Birthday.", comment: "Nice… Happy Birthday.")
        let t218 = NSLocalizedString("Where are you??????", comment: "Where are you??????")
        let t219 = NSLocalizedString("Rachel, srsly mom and dad are worried!!!", comment: "Rachel, srsly mom and dad are worried!!!")
        let t220 = NSLocalizedString("Rachel is gone", comment: "Rachel is gone")

        
        //CONVERSAS
        let strangerMessages = [Message(text: NSLocalizedString("Hi", comment: "Hi"), owner: stranger), Message(text: NSLocalizedString("Remember me?", comment: "Remember me?"), owner: stranger), Message(text: NSLocalizedString("the app boy", comment: "Remember me?"), owner: stranger), Message(text: NSLocalizedString("let's hang out again", comment: "let's hang out again"), owner: stranger), Message(text: "Rach?", owner: stranger), Message(text: "Rachel??", owner: stranger), Message(text: "Racheline???", owner: stranger), Message(text: NSLocalizedString("CHRIST, Answer my calls", comment: "CHRIST, Answer my calls"), owner: stranger), Message(text: NSLocalizedString( "please. stop.", comment:  "please. stop."), owner: rachel), Message(text: "Rachel!!!", owner: stranger), Message(text: NSLocalizedString( "stop", comment:  "stop"), owner: rachel), Message(text: "ok", owner: stranger), Message(text: NSLocalizedString("but when will we hang out again?", comment: "but when will we hang out again?"), owner: stranger)]
        
        let strangerTwoMessages = [Message(text: NSLocalizedString("what happened?", comment: "what happened?"), owner: strangerTwo), Message(text: NSLocalizedString( "did you block my number? or changed yours?", comment:  "did you block my number? or changed yours?"), owner: strangerTwo), Message(text: NSLocalizedString( "you again???", comment:  "you again???"), owner: rachel), Message(text: NSLocalizedString( "heh. why don't you wanna talk to me?", comment:  "heh. why don't you wanna talk to me?") , owner: strangerTwo), Message(text: NSLocalizedString( "is there anything else I can try?", comment:   "is there anything else I can try?"), owner: strangerTwo), Message(text: NSLocalizedString( "like morse", comment:   "like morse"), owner: strangerTwo), Message(text:  NSLocalizedString( "i now where you live. i'm calling the cops", comment: "i now where you live. i'm calling the cops") , owner: rachel), Message(text: NSLocalizedString( "why????????", comment: "why????????"), owner: strangerTwo), Message(text: NSLocalizedString( "is morse ilegal?", comment:"is morse ilegal?" ), owner: strangerTwo), Message(text: NSLocalizedString( ".. / -.. --- -. - / - .... .. -. -.- / ... ---" , comment: ".. / -.. --- -. - / - .... .. -. -.- / ... ---" ) , owner: strangerTwo)]
        
        let amandaMessages = [Message(text: t1, owner: amanda), Message(text: t2, owner: rachel), Message(text: t3, owner: amanda), Message(text: t4, owner: rachel), Message(text: t5 , owner: amanda), Message(text: t6 , owner: rachel), Message(text: t7, owner: amanda), Message(text: t8, owner: rachel), Message(text: t9, owner: amanda), Message(text: t10, owner: rachel), Message(text: t11, owner: amanda), Message(text:t12 , owner: rachel), Message(text: t13, owner: amanda), Message(text: t14, owner: rachel), Message(text: t15, owner: amanda), Message(text: t16, owner: rachel), Message(text: t17, owner: amanda), Message(text: t18, owner: rachel), Message(text: t19, owner: amanda), Message(text: t20, owner: rachel), Message(text: t21, owner: amanda), Message(text: t22, owner: amanda), Message(text: t23, owner: rachel), Message(text: t24, owner: amanda), Message(text: t25, owner: rachel), Message(text: t26, owner: rachel), Message(text: t27, owner: amanda), Message(text: t28, owner: rachel), Message(text: t29, owner: amanda), Message(text: t30, owner: rachel), Message(text: t31, owner: amanda), Message(text: t32, owner: rachel), Message(text: t33, owner: amanda), Message(text: t34, owner: rachel), Message(text: t35, owner: amanda), Message(text: t36, owner: amanda), Message(text: t37, owner: amanda), Message(text: t38, owner: amanda), Message(text: t39, owner: rachel), Message(text: t40, owner: amanda), Message(text: t41, owner: rachel), Message(text: t42, owner: amanda), Message(text: t43, owner: rachel), Message(text: t44, owner: amanda), Message(text: t45, owner: amanda), Message(text: t46, owner: rachel), Message(text: t47, owner: amanda), Message(text: t48, owner: rachel), Message(text: t49 , owner: amanda), Message(text: t50, owner: rachel), Message(text: t51, owner: rachel), Message(text: t52, owner: amanda), Message(text: t53, owner: amanda), Message(text: t54, owner: amanda)]
        
        let lisaMessages = [Message(text: t55, owner: rachel), Message(text: t56, owner: lisa), Message(text: t57, owner: lisa), Message(text: t58, owner: rachel), Message(text: t59, owner: lisa), Message(text: t60, owner: rachel), Message(text: t61, owner: lisa), Message(text: t62, owner: rachel), Message(text: t63, owner: lisa), Message(text: t64, owner: rachel), Message(text: t65, owner: lisa), Message(text: t66, owner: rachel), Message(text: t67, owner: lisa), Message(text: t68, owner: rachel), Message(text: t69 , owner: rachel), Message(text: t70, owner: lisa), Message(text: t71, owner: rachel), Message(text: t72, owner: lisa), Message(text: t73, owner: rachel), Message(text: t74, owner: lisa), Message(text: t75, owner: rachel), Message(text: t76, owner: lisa), Message(text: t77, owner: rachel), Message(text: t78, owner: rachel), Message(text: t79, owner: rachel), Message(text: t80, owner: lisa), Message(text: t81, owner: rachel), Message(text: t82, owner: lisa), Message(text: t83, owner: rachel), Message(text: t84, owner: lisa), Message(text: t85, owner: rachel), Message(text: t86, owner: lisa), Message(text: t87, owner: rachel), Message(text: t88, owner: lisa), Message(text: t89, owner: lisa), Message(text: t90, owner: rachel), Message(text: t91, owner: lisa)]
        
        let joshMessages = [Message(text: t95, owner: josh), Message(text: t96, owner: rachel), Message(text: t97, owner: josh), Message(text: t98, owner: rachel), Message(text: t99, owner: josh), Message(text: t100, owner: rachel), Message(text: t101, owner: josh), Message(text: t102, owner: rachel), Message(text: t103, owner: josh), Message(text: t104, owner: rachel), Message(text: t105, owner: josh), Message(text: t106, owner: rachel), Message(text: t107, owner: josh), Message(text: t108, owner: rachel), Message(text: t109, owner: josh), Message(text: t110, owner: rachel), Message(text: t111, owner: josh), Message(text: t112, owner: josh), Message(text: t113, owner: rachel), Message(text: t114, owner: josh), Message(text: t115, owner: rachel), Message(text: t116, owner: josh), Message(text: t117, owner: rachel), Message(text: t118, owner: josh), Message(text: t119, owner: rachel), Message(text: t120, owner: josh), Message(text: t121, owner: rachel), Message(text: t122, owner: josh), Message(text: t123 , owner: rachel), Message(text: t124, owner: josh), Message(text: t125, owner: rachel), Message(text: t126, owner: josh), Message(text: t127, owner: rachel), Message(text: t128, owner: josh), Message(text: t129, owner: rachel), Message(text: t128, owner: josh), Message(text: t129, owner: josh), Message(text: t130, owner: rachel), Message(text: t130, owner: josh), Message(text: t131, owner: rachel), Message(text: t132, owner: rachel), Message(text: t133, owner: josh), Message(text: t134, owner: rachel), Message(text: t135, owner: rachel), Message(text: t136, owner: josh)]
        
        let williamMessages = [Message(text: t137, owner: william), Message(text: t138, owner: rachel), Message(text: t139, owner: william), Message(text: t140, owner: rachel), Message(text: t141, owner: william), Message(text: t142, owner: rachel), Message(text: t143, owner: william), Message(text: t144, owner: rachel), Message(text: t145, owner: william), Message(text: t146, owner: rachel), Message(text: t147, owner: william), Message(text:t148 , owner: rachel), Message(text:t149 , owner: william), Message(text: t150, owner: rachel), Message(text: t151, owner: william), Message(text: t152, owner: william), Message(text: t153, owner: rachel), Message(text: t154, owner: william), Message(text: t155, owner: rachel), Message(text: t156, owner: william), Message(text: t157, owner: rachel), Message(text: t158, owner: rachel), Message(text: t159, owner: william), Message(text: t160, owner: rachel), Message(text: t161, owner: william)]
        
        let momMessages = [Message(text: t162, owner: rachel), Message(text: t163, owner: mom), Message(text: t164, owner: rachel), Message(text: t165, owner: mom), Message(text: t166, owner: rachel), Message(text: t167, owner: mom), Message(text: t168, owner: rachel), Message(text: t169, owner: mom), Message(text: t170, owner: rachel), Message(text: t171, owner: mom), Message(text: t172, owner: mom), Message(text: t173, owner: mom), Message(text: t174, owner: rachel), Message(text: t175, owner: rachel), Message(text: t176, owner: mom), Message(text: t177, owner: rachel),Message(text: t178, owner: mom), Message(text: t179, owner: mom), Message(text: t180, owner: rachel), Message(text: t181, owner: mom), Message(text: t181, owner: rachel), Message(text: t182, owner: mom), Message(text: t183, owner: rachel), Message(text: t184, owner: mom), Message(text: t185, owner: rachel), Message(text: t186, owner: mom), Message(text: t187, owner: rachel), Message(text: t188, owner: mom), Message(text: t189, owner: mom), Message(text: t190, owner: mom), Message(text: t191, owner: mom), Message(text: t192, owner: mom), Message(text: t193, owner: mom), Message(text: t194, owner: mom), Message(text: t195, owner: mom), Message(text: t196, owner: mom), Message(text: t197, owner: mom), Message(text: t198, owner: mom), Message(text: t199, owner: mom), Message(text: t200, owner: mom), Message(text: t201, owner: mom)]
        
        let annieMessages = [Message(text: t202, owner: annie), Message(text: t203, owner: rachel), Message(text: t204, owner: annie), Message(text: t205, owner: rachel), Message(text: t206, owner: annie), Message(text: t207, owner: rachel), Message(text: t208, owner: annie), Message(text: t209, owner: rachel), Message(text: t210, owner: annie), Message(text: t211, owner: annie), Message(text: t212, owner: annie), Message(text: t213, owner: annie), Message(text: t214, owner: annie), Message(text: t215, owner: annie), Message(text: t216, owner: annie), Message(text: t217, owner: annie), Message(text: t218, owner: rachel)]
        
        //LISTA DE CONVERSAS
        talkList.append(Talk(remetente: annie, messsageList: annieMessages))
        talkList.append(Talk(remetente: mom, messsageList: momMessages))
        talkList.append(Talk(remetente: amanda, messsageList: amandaMessages))
        talkList.append(Talk(remetente: lisa, messsageList: lisaMessages))
        talkList.append(Talk(remetente: josh, messsageList: joshMessages))
        talkList.append(Talk(remetente: strangerTwo, messsageList: strangerTwoMessages))
        talkList.append(Talk(remetente: william, messsageList: williamMessages))
        talkList.append(Talk(remetente: stranger, messsageList: strangerMessages))
        
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
