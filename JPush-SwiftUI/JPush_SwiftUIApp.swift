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
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                    print("Moving to the background!")
                }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                    //重置脚标
                    UIApplication.shared.applicationIconBadgeNumber = 0 //本地
                    UIApplication.shared.cancelAllLocalNotifications()
                    JPUSHService.resetBadge() //极光
                    print("Moving back to the foreground!")
                }
        }
    }
}
