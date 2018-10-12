//
//  APIEventModel.swift
//  HamroProject
//
//  Created by kiran on 10/12/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import Foundation

class APIEventModel {
    let distance, eventID, eventName, eventDescription: String?
    let location, startDate: String?
    let longitude, latitude: Double?
    let endDate: String?
    let mainImage: String?
    let eventPrice: String?
    let isRunning: Int?
    let  hasParticipants, isUserInterested, isUserGoing: Int?
    let hasUserViewedEvent, isSponsored: Int? //
    let sponsoredTitle, specialevents: String?
    
    init(eventJson: NSDictionary) {
        self.distance = eventJson["distance"] as? String
        self.eventID =  eventJson["eventID"] as? String
        self.eventName =  eventJson["eventName"] as? String
        self.eventDescription =  eventJson["eventDescription"] as? String
        self.location =  eventJson["location"] as? String
        if let latDouble = eventJson["latitude"] as? String {
            self.latitude = Double(latDouble)
        } else {
            self.latitude = nil
        }
        if let longDouble = eventJson["longitude"] as? String {
            self.longitude = Double(longDouble)
        } else {
            self.longitude = nil
        }
        self.startDate =  eventJson["start_date"] as? String
        self.endDate =  eventJson["end_date"] as? String
        self.mainImage =  eventJson["mainImage"] as? String
        self.eventPrice =  eventJson["eventPrice"] as? String
        self.isRunning =  eventJson["isRunning"] as? Int
        self.hasParticipants =  eventJson["hasParticipants"] as? Int
        self.isUserInterested =  eventJson["isUserInterested"] as? Int
        self.isUserGoing =  eventJson["isUserGoing"] as? Int
        self.hasUserViewedEvent =  eventJson["hasUserViewedEvent"] as? Int
        self.isSponsored =  eventJson["isSponsored"] as? Int
        self.sponsoredTitle =  eventJson["sponsoredTitle"] as? String
        self.specialevents =  eventJson["specialevents"] as? String
        
    }
        
}
