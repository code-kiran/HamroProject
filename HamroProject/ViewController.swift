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
        mytable.delegate = self
        mytable.dataSource = self
        mytable.reloadData()
        newSqlManager.createDatabase()
       userArray = newSqlManager.getUserData()
      eventsArray = newSqlManager.getEventData()
        
       
    }
    
    
    @IBAction func lognbtn(_ sender: Any) {
let isuservala = newSqlManager.userLogin(email: "b", password: "b")
        if isuservala == true {
             navigateToHome()
             print("login successful")
           
        }
        else {
            print("unvlaid user")
        }
    }
    
    @IBAction func addevent(_ sender: Any) {
        let email =  "d"
        let doesEmailExists = newSqlManager.checkIfEmailisAlreadyThere(email: email)
        if doesEmailExists {
            print("email already there please choose different one ")
        } else {
            newSqlManager.putUserData(firstName: "d", lastName: "d", userName: "d", email: email, password: "d")
            
        }

        
    }
    
    func navigateToHome() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "Home") as! Home
      
        self.navigationController?.pushViewController(vc, animated: true)
        

        }

        
        
    }



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? tblcell
        return cell!
    }
    
    
    
}

