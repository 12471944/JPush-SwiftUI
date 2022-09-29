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
    
    init() {
        NotificationCenter.default.addObserver(forName: .jpfNetworkDidReceiveMessage, object: nil, queue: .main, using: receiveMessage)
        NotificationCenter.default.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: .main, using: enterBackground)
        NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main, using: enterForeground)
    }
    
    //极光推送自定义消息
    func receiveMessage(_ notification: Notification){
        let userInfo = notification.userInfo as? Dictionary<String,Any>
        if userInfo != nil {
            print(userInfo!["content"])
        }
    }
    
    //进入后台
    func enterBackground(_ notification: Notification){
        print("Moving to the background!")
    }
    
    //唤醒
    func enterForeground(_ notification: Notification){
        print("Moving back to the foreground!")
        //重置脚标
        UIApplication.shared.applicationIconBadgeNumber = 0 //本地
        JPUSHService.resetBadge() //极光
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .onReceive(NotificationCenter.default.publisher(for: .jpfNetworkDidReceiveMessage)) { notification in
//                    let userInfo = notification.userInfo as? Dictionary<String,Any>
//                    print( userInfo!)
//                }
//                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
//                    print("Moving to the background!")
//                }
//                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
//                    //重置脚标
//                    UIApplication.shared.applicationIconBadgeNumber = 0 //本地
//                    UIApplication.shared.cancelAllLocalNotifications()
//                    JPUSHService.resetBadge() //极光
//                    print("Moving back to the foreground!")
//                }
        }
    }
}
