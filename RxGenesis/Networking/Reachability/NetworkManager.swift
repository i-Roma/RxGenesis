//
//  NetworkManager.swift
//  BHIRED
//
//  Created by Roman Romanenko on 1/14/19.
//  Copyright © 2019 BHIRED. All rights reserved.
//

import Foundation
//import Reachability

/// Global var
var isNetworkReachable: Bool {
    return NetworkReachability.sharedInstance.reachability.isReachable
}

let isNetworkReachableKey = "isNetworkReachableKey"

class NetworkReachability: NSObject {
    
    // MARK: Property
    
    var reachability: Reachability!
    
    // Create a singleton instance
    static let sharedInstance: NetworkReachability = { return NetworkReachability() }() //NetworkReachability()
    
    // MARK: Life cycle

    override init() {
        super.init()
        
        // Initialise reachability
        reachability = Reachability()!
        
        // Register an observer for the network status
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(networkStatusChanged(_:)),
            name: .reachabilityChanged,
            object: reachability
        )
        
        do {
            // Start the network status notifier
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    @objc func networkStatusChanged(_ notification: Notification) {

        let reachability: [String: Bool] = [isNetworkReachableKey: isNetworkReachable]
        NotificationCenter.default.post(name: .networkStatusChanged, object: nil, userInfo: reachability)
        
    }
    
    static func stopNotifier() -> Void {
        // Stop the network status notifier
        NetworkReachability.sharedInstance.reachability.stopNotifier()

        do {
            // Stop the network status notifier
            try (NetworkReachability.sharedInstance.reachability).startNotifier()
        } catch {
            print("Error stopping notifier")
        }
    }
    
    // Network is reachable
    static func isReachable(completed: @escaping (NetworkReachability) -> Void) {
        if (NetworkReachability.sharedInstance.reachability).connection != .none {
            completed(NetworkReachability.sharedInstance)
        }
    }
    
    // Network is unreachable
    static func isUnreachable(completed: @escaping (NetworkReachability) -> Void) {
        if (NetworkReachability.sharedInstance.reachability).connection == .none {
            completed(NetworkReachability.sharedInstance)
        }
    }
    
    // Network is reachable via WWAN/Cellular
    static func isReachableViaWWAN(completed: @escaping (NetworkReachability) -> Void) {
        if (NetworkReachability.sharedInstance.reachability).connection == .cellular {
            completed(NetworkReachability.sharedInstance)
        }
    }
    
    // Network is reachable via WiFi
    static func isReachableViaWiFi(completed: @escaping (NetworkReachability) -> Void) {
        if (NetworkReachability.sharedInstance.reachability).connection == .wifi {
            completed(NetworkReachability.sharedInstance)
        }
    }
    
//    deinit {
//        NetworkReachability.sharedInstance.reachability.stopNotifier()
//    }
}

// MARK: Name for notification

extension Notification.Name {
    static let networkStatusChanged = Notification.Name("networkStatusChanged")
}
