//
//  SPMsAndSDKsApp.swift
//  SPMsAndSDKs
//
//  Created by Berkay Tuncel on 2.05.2024.
//

import SwiftUI
import SwiftfulUI

@main
struct SPMsAndSDKsApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(delegate: RootDelegate(
                onApplicationDidAppear: {
                    debugPrint("onApplicationDidAppear")
                }, onApplicationWillEnterForeground: { notification in
                    debugPrint(notification.name.rawValue)
                }, onApplicationDidBecomeActive: { notification in
                    debugPrint(notification.name.rawValue)
                }, onApplicationWillResignActive: { notification in
                    debugPrint(notification.name.rawValue)
                }, onApplicationDidEnterBackground: { notification in
                    debugPrint(notification.name.rawValue)
                }, onApplicationWillTerminate: { notification in
                    debugPrint(notification.name.rawValue)
                })) {
                SwiftfulUIBootcamp()
            }
        }
    }
}
