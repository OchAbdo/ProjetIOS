//
//  ProjetIOSApp.swift
//  ProjetIOS
//
//  Created by Tekup-mac-4 on 23/4/2025.
//
import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


@main
struct ProjetIOSApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            //ContentView()
            
            if isLoggedIn {
                           NavigationStack {
                               MainPage()
                           }
                       } else {
                           SplashScreenView()
                       }
        }
    }
}
