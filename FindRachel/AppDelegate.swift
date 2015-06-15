//
//  AppDelegate.swift
//  FindRachel
//
//  Created by Julia Motta Baitelli on 19/05/15.
//  Copyright (c) 2015 Julia Motta Baitelli. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let defaults = NSUserDefaults.standardUserDefaults()
    
    func isAppAlreadyLaunchedOnce()-> Bool {
        
        if (defaults.integerForKey("hasRun") == 0){
            defaults.setInteger(1, forKey: "hasRun")
            defaults.synchronize()
            return true
            
        }
        
        return false
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        println(defaults.integerForKey("hasRun").description)
        println(defaults.integerForKey("GamePhase").description)
        
            var mainScreenVC: MainScreenVC = MainScreenVC(nibName:"MainScreen", bundle: nil)
            self.window!.rootViewController = mainScreenVC
  
        
        
        
        if defaults.integerForKey("hasRun") == 0 {

            var entranceViewController: EntranceViewController = EntranceViewController(nibName:"EntranceViewController", bundle: nil)
            self.window!.rootViewController = entranceViewController
     
            isAppAlreadyLaunchedOnce()
            
        } else {
    
            if defaults.integerForKey("GamePhase") == 2 {
                
                var lockerVC: LockerVC = LockerVC(nibName:"Locker", bundle: nil)
                self.window!.rootViewController = lockerVC
                
            }  else if defaults.integerForKey("GamePhase") == 3 {
                
                var lockerVC: LockerVC = LockerVC(nibName:"Locker", bundle: nil)
                self.window!.rootViewController = lockerVC
                
                
            } else if defaults.integerForKey("GamePhase") == 4 {
                
                var lockerVC: LockerVC = LockerVC(nibName:"Locker", bundle: nil)
                self.window!.rootViewController = lockerVC
                

                
                
            } else if defaults.integerForKey("GamePhase") == 5 {
                
                var finishedVC: FinishedVC = FinishedVC(nibName:"FinishedVC", bundle: nil)
                self.window!.rootViewController = finishedVC
                
            }

            
        }
        
        //isso aqui tem que voltar
//        var controller: TestViewController = TestViewController(nibName:"TestViewController", bundle: nil)
//        self.window!.rootViewController = controller

//

        
        
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

