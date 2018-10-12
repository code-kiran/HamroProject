//
//  ViewController.swift
//  HamroProject
//
//  Created by kiran on 10/9/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import Foundation

class EventModel {
    var eventId: String?
    var eventName: String?
    var eventDescrip: String?
    var eventLocation: String?
    var userId: String?
    var userName: String?
    
    init(event: NSDictionary) {
        self.eventId = event["eventId"] as? String
        self.eventName = event["eventTitle"] as? String
        self.eventDescrip = event["eventDescription"] as? String
        self.eventLocation = event["eventLocation"] as? String
        self.userId = event["userId"] as? String
        self.userName = event["userName"] as? String
        
}
    
}
