//
//  AppDelegate.swift
//  Todoey
//
//  Created by Maha AlDwehy on 19/09/1439 AH.
//  Copyright © 1439 Maha AlDwehy. All rights reserved.
//

import UIKit

import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISearchBarDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
         _ = try Realm()
            
    } catch {
            print("Error initalising new realm, \(error)")
        }
        return true
    }


}

