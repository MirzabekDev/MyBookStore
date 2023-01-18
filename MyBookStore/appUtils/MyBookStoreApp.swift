//
//  MyBookStoreApp.swift
//  MyBookStore
//
//  Created by Mirzabek on 06/01/23.
//

import SwiftUI
import Firebase
@main

struct MyBookStoreApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            StarterPage().environmentObject(SessionStore())
        }
    }
}
    class AppDelegate: NSObject, UIApplicationDelegate {
      func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
      }
}
