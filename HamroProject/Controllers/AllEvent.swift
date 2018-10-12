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
        allEventArray = newSqlManager.getEventData()
       // print(allEventArray)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        allEventsTable.reloadData()

    }
    
    @IBAction func addEvent(_ sender: Any) {
        
    }
    

}

extension AllEvent: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEventArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allEventCell = tableView.dequeueReusableCell(withIdentifier: "AllEventCell", for: indexPath) as? AllEventCell
        allEventCell?.eventTitle.text = allEventArray[indexPath.row].eventName
        allEventCell?.eventDesc.text = allEventArray[indexPath.row].eventDescrip
        allEventCell?.eventLocation.text = allEventArray[indexPath.row].eventLocation
        return allEventCell!
        
    }
    
    
}
