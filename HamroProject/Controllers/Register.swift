//
//  Register.swift
//  HamroProject
//
//  Created by kiran on 10/11/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit
import SQLite3
import Toast_Swift


class Register: UIViewController {
    let newSqlManager = SqlManager()
    
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var conformPasswordTextField: UITextField!
    @IBOutlet weak var toastView: UIView!
    
      var successMessage : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        // self.view!.makeToast("This is a piece of toast", duration: 3.0, position: .bottom, style: nil)
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        if fullNameTextField.text!.isEmpty || userNameTextField.text!.isEmpty || passwordTextField.text!.isEmpty || passwordTextField.text! != conformPasswordTextField.text!  {
            ErrorReporting.showMessage(title: "Register Unsuccessfull", msg: "Something wrong with the inputs  Please fill the form Correctly . All the forms should be filled")
        } else {
            newSqlManager.createDatabase()
            let email =  emailTextField.text
            let doesEmailExists = newSqlManager.checkIfEmailisAlreadyThere(email: email!)
            if doesEmailExists {
                ErrorReporting.showMessage(title: "Invalid Email", msg: "Email Already Exist ")
            } else {
                newSqlManager.putUserData(firstName: fullNameTextField.text!, lastName: "b", userName: userNameTextField.text!, email: email!, password: passwordTextField.text!)
                
             self.view!.makeToast("Regristration Successful. ", duration: 1.0, position: .center)
                //dismiss(animated: true, completion: nil)
                //  ErrorReporting.showMessage(title: "Regristration Successful! ", msg: "You can now login")
                
            }
        }
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
