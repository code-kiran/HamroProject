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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userId = UserDefaults.standard.value(forKey: "userId") as? String
        
    }
    
    @IBAction func creatEventButton(_ sender: Any) {
        if userId != nil {
            newSqlManager.putEventData(title: eventTitle.text!, description: eventDescription.text!, userId: userId!, location: eventLocation.text!, date: "date")
            _ = navigationController?.popViewController(animated: true)
                    }
        else {
            print("there is no userid so cannnot save the event data ")
        }

        
    }
}
