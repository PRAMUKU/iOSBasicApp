//
//  iOSBasicAppApp.swift
//  iOSBasicApp
//
//  Created by Pramuk.u on 15/03/25.
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
struct iOSBasicAppApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
//    Simply configure the Firebass in the initializers
//    init() {
//        FirebaseApp.configure()
//    }

    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
