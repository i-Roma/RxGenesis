//
//  UIViewController+Alert.swift
//  BitMinerals
//
//  Created by Roman Romanenko on 5/6/18.
//  Copyright © 2018 Roman Billionaire. All rights reserved.
//

import UIKit

fileprivate struct Alert {
    static let title = appName
    static let ok = "Ok"
}

extension UIViewController {
    
    
    func showAlert(title: String = Alert.title, message: String, okButtonTitle: String = Alert.ok) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okButtonTitle, style: .default, handler: nil)
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlertWithCompletion(title: String = Alert.title, message: String, okButtonTitle: String = Alert.ok, handler: @escaping () -> Void) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okButtonTitle, style: .default, handler: nil)
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: handler)
        }
    }
    
    func showAlertWithCompletionAction(title: String = Alert.title, message: String, handler: @escaping () -> Void) -> Void {
        
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: Alert.ok, style: .default, handler: { (action) -> Void in
            print("showAlertWithCompletionAction Ok button click...")
            handler()
        })
        
        dialogMessage.addAction(ok)
        
        self.present(dialogMessage, animated: true, completion: nil)
    }
}

