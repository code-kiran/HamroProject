//
//  Home.swift
//  HamroProject
//
//  Created by kiran on 10/9/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit
import UserNotifications

class Home111: UIViewController {
    @IBOutlet weak var homeTable: UITableView!
    let newSqlManager = SqlManager()
    var userCreatedEventsArray = [EventModel]()
   var userId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // homeTable.delegate = self
       // homeTable.dataSource = self
//userId = UserDefaults.standard.string(forKey: "userId")
        userCreatedEventsArray = newSqlManager.getEventDataFromSpecificUser(userId: userId!)
        homeTable.reloadData()
       // UNUserNotificationCenter.current().delegate = self
      //  addNotification()
      
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    @IBAction func addEventButton(_ sender: Any) {
                if userId != nil {
                    let title = "Musical Event"
                    let desc = "hy this is new event description about musical event"
                    newSqlManager.putEventData(title: title, description: desc, userId: userId!, location: "b", date: "b")
                    addNotification(userId: userId!, title: title, desc: desc)
                    
                }
                else {
                    print("there is no userid so cannnot save the event data ")
                }
    }
    
    @IBAction func logoutButton(_ sender: Any) {
    //   navigationController?.popToRootViewController(animated: true)
    }
    
    func addNotification(userId: String, title: String, desc: String) {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "user with id: \(userId) added \(title)"
        content.body = desc
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "yourIdentifier"
        content.userInfo = ["example": "information"] // You can retrieve this when displaying notification
        
        // Setup trigger time
//        var calendar = Calendar.current
//        calendar.timeZone = TimeZone.current
       // let testDate = Date() + 5 // Set this to whatever date you need
     //   let trigger = UNCalendarNotificationTrigger(dateMatching: testDate, repeats: false)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
        
        // Create request
        let uniqueID = UUID().uuidString // Keep a record of this if necessary
        let request = UNNotificationRequest(identifier: uniqueID, content: content, trigger: trigger)
        center.add(request) { (error) in
            if error != nil {
                print("error ")
            }
        }
    }
    
    
}
extension Home: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
}

//extension Home: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//      //  return userCreatedEventsArray.count
//    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
       // cell.textLabel?.text = userCreatedEventsArray[indexPath.row].eventDescrip
        return cell
    }
    
    

