//
//  AppDelegate.swift
//  FinacialAnalyzingApp
//
//  Created by pei on 2017-04-08.
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var backgroundTaskIdentifier: UIBackgroundTaskIdentifier?

    func update() {
//        var topController = UIApplication.shared.keyWindow?.rootViewController as? RootViewController
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let tmpVC = storyBoard.instantiateViewController(withIdentifier: "RootView") as? RootViewController
        UIApplication.shared.keyWindow?.rootViewController = tmpVC
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        NSTimeZone.default = TimeZone.ReferenceType.local
//
//        backgroundTaskIdentifier = UIApplication.shared.beginBackgroundTask(expirationHandler: {
//            UIApplication.shared.endBackgroundTask(self.backgroundTaskIdentifier!)
//        })
//        _ = Timer.scheduledTimer(timeInterval: 43200, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        if UIApplication.shared.isIgnoringInteractionEvents {
            UIApplication.shared.beginIgnoringInteractionEvents()
        }
        // Override point for customization after application launch.
        DataManagement.sharedInstance.windowSize = (self.window?.bounds.size)!
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
//        let currentDate = NSDate()
//        let dateFormatter = DateFormatter.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

