//
//  JPush_SwiftUIApp.swift
//  JPush-SwiftUI
//
//  Created by Qiezi on 2022/9/28.
//

import SwiftUI

@main
struct JPush_SwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
