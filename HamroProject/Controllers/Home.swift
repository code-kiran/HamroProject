//
//  Home.swift
//  HamroProject
//
//  Created by kiran on 10/11/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit

class Home: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        UserDefaults.standard.set("", forKey: "userEmail")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Login") as! Login
        let navigationController = UINavigationController(rootViewController: newViewController)
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = navigationController
        
    }
    
}
