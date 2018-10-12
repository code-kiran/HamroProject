//
//  Login.swift
//  HamroProject
//
//  Created by kiran on 10/11/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit


class Login: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginViewTitleLable: UILabel!
    let newSqlManager = SqlManager()
   // let username: String
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        newSqlManager.createDatabase()
        let isuservalid = newSqlManager.userLogin(email: emailTextField.text!, password: passwordTextField.text!)
        if isuservalid == true {
            UserDefaults.standard.set(true, forKey: "islogin")
           // UserDefaults.standard.set(username , forKey: "userName")
                       navigateToTabBar()
        }
        else {
           ErrorReporting.showMessage(title: "Login Failed", msg: "Invalid UserName or Password")
        }
    }

    
    @IBAction func signUpButton(_ sender: Any) {
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "Register") as? Register  {
       self.present(destinationVC, animated: true, completion: nil)
        }
    }
    
    func navigateToTabBar() {
        if let tabbar = (storyboard!.instantiateViewController(withIdentifier: "TabBar") as? UITabBarController) {
            self.present(tabbar, animated: true, completion: nil)
        }
    }
    
}
