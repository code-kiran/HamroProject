//
//  AddEvent.swift
//  HamroProject
//
//  Created by kiran on 10/11/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit

class AddEvent: UIViewController {
    let newSqlManager = SqlManager()

    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var eventDescription: UITextField!
    @IBOutlet weak var eventLocation: UITextField!
    
    var userId: String?
    var userName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userId = UserDefaults.standard.value(forKey: "userId") as? String
        userName = UserDefaults.standard.value(forKey: "userName") as? String
          self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Menlo", size: 18)!]
        
    }
    
    @IBAction func creatEventButton(_ sender: Any) {
        if eventTitle.text!.isEmpty || eventDescription.text!.isEmpty || eventLocation.text!.isEmpty {
     ErrorReporting.showMessage(title: "Adding Event UnSuccessful", msg: "Fields cannot be Empty . Please fill all the forms")

        } else {
        if userId != nil {
            newSqlManager.putEventData(title: eventTitle.text!, description: eventDescription.text!, userId: userId!, location: eventLocation.text!, date: "date", userName: userName!)
            _ = navigationController?.popViewController(animated: true)
        }
        else {
            print("there is no userid so cannnot save the event data ")
        }
        }
    }
}
