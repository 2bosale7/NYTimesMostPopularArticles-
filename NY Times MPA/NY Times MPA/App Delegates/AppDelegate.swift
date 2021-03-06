//
//  AppDelegate.swift
//  NY Times MPA
//
//  Created by Mohammed Saleh on 6/13/20.
//  Copyright © 2020 me. All rights reserved.
//

import UIKit
import Alamofire

var isNetworkReachable = NetworkReachabilityManager()?.isReachable ?? false

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = UIColor(red: 0.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1)
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        
        //MARK:- Network Manager
        let net = NetworkReachabilityManager(host: "www.apple.com")
        net?.startListening(onUpdatePerforming: { status in
            switch status
            {
                case .reachable(.ethernetOrWiFi):
                    print("#-The network is reachable over the WiFi connection")
                    
                    isNetworkReachable = true
                    NotificationCenter.default.post(name: Notification.Name("notifyIntetnetStatus"), object: true)
                
                case .reachable(.cellular):
                    print("#-The network is reachable over the cellular connection")
                    
                    isNetworkReachable = true
                    NotificationCenter.default.post(name: Notification.Name("notifyIntetnetStatus"), object: true)
                
                case .notReachable:
                    print("#-The network is not reachable")
                    
                    isNetworkReachable = false
                    NotificationCenter.default.post(name: Notification.Name("notifyIntetnetStatus"), object: false)
                case .unknown :
                    print("#-The network is unknown whether it is reachable or not")
                    
                    isNetworkReachable = false
                    NotificationCenter.default.post(name: Notification.Name("notifyIntetnetStatus"), object: false)
            }
        })

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

