//
//  Register.swift
//  HamroProject
//
//  Created by kiran on 10/11/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit
import SQLite3



class Register: UIViewController {
    let newSqlManager = SqlManager()
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var conformPasswordTextField: UITextField!
    
      var successMessage : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        newSqlManager.createDatabase()
        let email =  emailTextField.text
        let doesEmailExists = newSqlManager.checkIfEmailisAlreadyThere(email: email!)
        if doesEmailExists {
            print("email already there please choose different one ")
        } else {
            newSqlManager.putUserData(firstName: fullNameTextField.text!, lastName: "b", userName: userNameTextField.text!, email: email!, password: passwordTextField.text!)
            dismiss(animated: true, completion: nil)
                        
        }
        
        
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
