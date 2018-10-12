//
//  All-Event.swift
//  HamroProject
//
//  Created by kiran on 10/12/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit

class AllEvent: UIViewController {
    let newSqlManager = SqlManager()
    @IBOutlet weak var allEventsTable: UITableView!
    var allEventArray = [EventModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allEventsTable.delegate = self
        allEventsTable.dataSource = self
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Menlo", size: 18)!]
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        allEventArray = newSqlManager.getEventData()

        allEventsTable.reloadData()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    
    
    @IBAction func addEvent(_ sender: Any) {
        if   let vc = storyboard?.instantiateViewController(withIdentifier: "AddEvent") as? AddEvent {
        self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    

}

extension AllEvent: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEventArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allEventCell = tableView.dequeueReusableCell(withIdentifier: "AllEventCell", for: indexPath) as? AllEventCell
       // let usernam = newSqlManager.getUsernameFromUserId(userId: allEventArray[indexPath.row].userId!)
        allEventCell?.eventTitle.text = allEventArray[indexPath.row].eventName
        allEventCell?.eventDesc.text = allEventArray[indexPath.row].eventDescrip
        allEventCell?.eventLocation.text = ("Event Created By: \( allEventArray[indexPath.row].userName ?? "defultvalue")")
        return allEventCell!
        
    }
    
    
}
