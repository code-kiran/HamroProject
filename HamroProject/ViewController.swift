//
//  ViewController.swift
//  HamroProject
//
//  Created by kiran on 10/9/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
    @IBOutlet weak var mytable: UITableView!
    let newSqlManager = SqlManager()
var userArray = [UserModel]()
    var eventsArray = [EventModel]()
  //  var userId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    
    @IBAction func lognbtn(_ sender: Any) {
//let isuservala = newSqlManager.userLogin(email: "b", password: "b")
//        if isuservala == true {
//             navigateToHome()
//             print("login successful")
//
//        }
//        else {
//            print("unvlaid user")
//        }
    }
    
    @IBAction func addevent(_ sender: Any) {
//        let email =  "b"
//        let doesEmailExists = newSqlManager.checkIfEmailisAlreadyThere(email: email)
//        if doesEmailExists {
//            print("email already there please choose different one ")
//        } else {
//            newSqlManager.putUserData(firstName: "b", lastName: "b", userName: "b", email: email, password: "b")
//
//        }
//
        
    }
}
