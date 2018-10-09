//
//  Home.swift
//  HamroProject
//
//  Created by kiran on 10/9/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit

class Home: UIViewController {
    @IBOutlet weak var homeTable: UITableView!
    let newSqlManager = SqlManager()
    var userCreatedEventsArray = [EventModel]()
   var userId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTable.delegate = self
        homeTable.dataSource = self
        userId = UserDefaults.standard.string(forKey: "userId")
        userCreatedEventsArray = newSqlManager.getEventDataFromSpecificUser(userId: userId!)
        homeTable.reloadData()
      
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    @IBAction func addEventButton(_ sender: Any) {
        
                if userId != nil {
                    newSqlManager.putEventData(title: "d", description: "d", userId: userId!, location: "d", date: "d")
                }
                else {
                    print("there is no userid so cannnot save the event data ")
                }
    }
    
    @IBAction func logoutButton(_ sender: Any) {
    //   navigationController?.popToRootViewController(animated: true)
      
    }
    
    
}

extension Home: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userCreatedEventsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        cell.detailTextLabel?.text = userCreatedEventsArray[indexPath.row].userId
        cell.textLabel?.text = userCreatedEventsArray[indexPath.row].eventId
        return cell
    }
    
    
}
