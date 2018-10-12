//
//  Alerts.swift
//  HamroProject
//
//  Created by kiran on 10/12/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit

extension UIApplication {
    
    static func topViewController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        
        return base
    }
}

class ErrorReporting {
    
    static func showMessage(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
        
    }    
    
//    let alert = UIAlertController(title: "Success", message: "Logged In", preferredStyle: .alert)
//    let action = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
//        let viewControllerYouWantToPresent = UIStoryboard?.instantiateViewControllerWithIdentifier("SomeViewControllerIdentifier")
//        self.presentViewController(viewControllerYouWantToPresent!, animated: true, completion: nil)
//    }
//    alert.addAction(action)
//    self.presentViewController(alert, animated: true, completion: nil)
}


