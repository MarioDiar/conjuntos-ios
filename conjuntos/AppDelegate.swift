//
//  AppDelegate.swift
//  conjuntos
//
//  Created by Mario Díaz on 4/2/16.
//  Copyright © 2016 Mario Díaz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        setStoryboard()
        return true
    }
    
    func setStoryboard() {
        let storyboard : UIStoryboard = self.grabStoryboard()
        self.setInitialScreen(storyboard)
    }
    
    func grabStoryboard() -> UIStoryboard {
        let screenHeight = Int(UIScreen.mainScreen().bounds.size.height)
        
        var storyboard : UIStoryboard
        print(screenHeight)
        
        switch (screenHeight) {
        case 667:
            storyboard = UIStoryboard(name: "Main iPhone6", bundle: nil)
            break
        case 736:
            storyboard = UIStoryboard(name: "Main iPhone6Plus", bundle: nil)
            break
        case 1024:
            storyboard = UIStoryboard(name: "Main iPad", bundle: nil)
            break
        default:
            storyboard = UIStoryboard(name: "Main", bundle: nil)
            break
            
        }
        return storyboard
    }
    
    func setInitialScreen(storyboard : UIStoryboard) {
        var initViewController : UIViewController
        
        initViewController = storyboard.instantiateViewControllerWithIdentifier("First")
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = initViewController
        self.window?.makeKeyAndVisible()
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

