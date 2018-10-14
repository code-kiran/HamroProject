//
//  PrivateEvent.swift
//  HamroProject
//
//  Created by kiran on 10/11/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit

class PrivateEvent: UIViewController {
    @IBOutlet weak var tbl: UITableView!
    let newSqlManager = SqlManager()
    
    var userCreatedEventsArray = [EventModel]() {
        didSet {
            tbl.reloadData()
        }
    }
    
    
    // var userCreatedEventsArray = [EventModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tbl.delegate = self
        tbl.dataSource = self
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Menlo", size: 18)!]
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userId =  UserDefaults.standard.value(forKey: "userId") as? String
        userCreatedEventsArray = newSqlManager.getEventDataFromSpecificUser(userId: userId!)
    }
    
    @IBAction func gotoAddEventVC(_ sender: Any) {
        if  let vc = storyboard?.instantiateViewController(withIdentifier: "AddEvent") as? AddEvent {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
}

extension PrivateEvent: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userCreatedEventsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eventCell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as? EventCell
        eventCell?.eventTitleLable.text = userCreatedEventsArray[indexPath.row].eventName
        eventCell?.eventDescLable.text = userCreatedEventsArray[indexPath.row].eventDescrip
        eventCell?.eventCreatedByLable.text = userCreatedEventsArray[indexPath.row].eventLocation
        return eventCell!
        
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteButton = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            self.tbl.dataSource?.tableView!(self.tbl, commit: .delete, forRowAt: indexPath)
            return
        }
        deleteButton.backgroundColor = UIColor.lightGray
        return [deleteButton]
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            let id = userCreatedEventsArray[indexPath.row].eventId
            newSqlManager.delelteEventById(Id: id!)
            userCreatedEventsArray.remove(at: indexPath.row)
            
        }
    }
    
    
    
}
