//
//  AppDelegate.swift
//  StretchTableView
//
//  Created by Linh Leduy on 11/05/21.
//  Copyright © 2021 Linh Leduy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupFonts()
        return true
    }
    
    private func setupFonts() {
        registerFont("WorkSans-Regular", "ttf")
        registerFont("Roboto-Medium", "ttf")
        registerFont("Roboto-Regular", "ttf")
        registerFont("WorkSans-Medium", "ttf")
        registerFont("WorkSans-SemiBold", "ttf")
        registerFont("Roboto-Bold", "ttf")
        registerFont("WorkSans-Bold", "ttf")
    }
    
    func registerFont(_ resource: String,_ extens: String) {
        let bundle = Bundle(for: AppDelegate.self)
        let url =  bundle.url(forResource: resource, withExtension: extens)
        
        guard let fontDataProvider = CGDataProvider(url: url! as CFURL) else {
            return
        }
        guard let font = CGFont(fontDataProvider) else {return}
        var error: Unmanaged<CFError>?
        guard CTFontManagerRegisterGraphicsFont(font, &error) else {
            return
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
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

