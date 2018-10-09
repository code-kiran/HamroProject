//
//  SqliteManager.swift
//  HamroProject
//
//  Created by kiran on 10/9/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import Foundation
import SQLite3


class SqlManager {
    var  db: OpaquePointer?
    
    func createDatabase() {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("HamroEventsDatabase.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
            return
        }
        
        //Mark:- Create table for Users
        
        if sqlite3_exec(db, "CREATE TABLE  IF NOT EXISTS Users (Id INTEGER PRIMARY KEY AUTOINCREMENT, FirstName TEXT, LastName TEXT,  Username TEXT, Email TEXT ,Password TEXT)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
            return
        }else{
            print("success creating usertable")
        }
        
        //Mark:- Create table for Events
        
        if sqlite3_exec(db, "CREATE TABLE  IF NOT EXISTS Events (Id INTEGER PRIMARY KEY AUTOINCREMENT, EventTitle TEXT, EventDescription TEXT, EventLocation TEXT, Date TEXT, UserId TEXT)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
            return
        }else{
            print("success creating event table")
        }
        
    }
    
    //MARK: - FOR USERS DATA
    
    func putUserData(firstName: String, lastName: String, userName: String, email: String, password: String) {
        createDatabase()
        let updateStatementString = "INSERT INTO Users (FirstName, LastName, Email, Username, Password) VALUES (\"\(firstName)\",\"\(lastName)\",\"\(email)\",\"\(userName)\",\"\(password)\");"
        print(updateStatementString)
        var updateStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("Successfully insert user data.")
            } else {
                print("Could not insert user data.")
            }
        } else {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            print("UPDATE statement could not be prepared")
        }
    }
    
    func getUserData() -> [UserModel]{
        createDatabase()
        var userData = [UserModel]()
        var stmt:OpaquePointer?
        let queryString = "SELECT * FROM Users;"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return userData
        }
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let userDict:NSDictionary = [
                "id" : String(cString: sqlite3_column_text(stmt, 0)),
                "firstName" : String(cString: sqlite3_column_text(stmt, 1)),
                "lastName" : String(cString: sqlite3_column_text(stmt, 2)),
                "userName" : String(cString: sqlite3_column_text(stmt, 3)),
                "email": String(cString: sqlite3_column_text(stmt, 4)),
                "password" : String(cString: sqlite3_column_text(stmt, 5)),
                
                
                ]
            userData.append(UserModel(user: userDict))
        }
        return userData
    }
    
    //login
    
    func userLogin(email: String, password: String) -> Bool{
        createDatabase()
        var isUserVaild = false
        var stmt:OpaquePointer?
        let queryString = "SELECT * FROM Users WHERE Email = '\(email)' and Password = '\(password)';"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
        }
        while(sqlite3_step(stmt) == SQLITE_ROW) {
            if email == String(cString: sqlite3_column_text(stmt, 4)) &&
                password ==  String(cString: sqlite3_column_text(stmt, 5)) {
                isUserVaild = true
                let userIdtoStore  = String(cString: sqlite3_column_text(stmt, 0))
                UserDefaults.standard.set(userIdtoStore, forKey: "userId")
                print(email)
                print(password)
                print(userIdtoStore)
                print(String(cString: sqlite3_column_text(stmt, 0)))

            }
            else {
                isUserVaild = false
            }
            
        }
        return isUserVaild
    }
    
    //check email
    
    func checkIfEmailisAlreadyThere(email: String) ->Bool {
        createDatabase()
        var isEmailAlreadyThere = false
        var stmt:OpaquePointer?
        let queryString = "SELECT * FROM Users WHERE Email = '\(email)';"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return isEmailAlreadyThere
        }
        while(sqlite3_step(stmt) == SQLITE_ROW){
            
            if  email == String(cString: sqlite3_column_text(stmt, 4)) {
            isEmailAlreadyThere = true
            } else {
                isEmailAlreadyThere = false
            }
            
        }
        return isEmailAlreadyThere
    }


    
    //MARK: - FOR EVENTS DATA
    
    func putEventData(title: String, description: String, userId: String, location: String, date: String) {
        createDatabase()
        let updateStatementString = "INSERT INTO Events ( EventTitle, EventDescription, EventLocation, Date, UserId) VALUES (\"\(title)\",\"\(description)\",\"\(userId)\",\"\(location)\",\"\(date)\");"
        print(updateStatementString)
        var updateStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("Successfully insert event data.")
            } else {
                print("Could not insert event data.")
            }
        } else {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            print("UPDATE statement could not be prepared")
        }
    }
    
    
    func getEventData() -> [EventModel]{
        createDatabase()
        var eventData = [EventModel]()
        var stmt:OpaquePointer?
        let queryString = "SELECT * FROM Events ;"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return eventData
        }
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let eventDict:NSDictionary = [
                "eventId" : String(cString: sqlite3_column_text(stmt, 0)),
                "eventTitle" : String(cString: sqlite3_column_text(stmt, 1)),
                "eventDescription" : String(cString: sqlite3_column_text(stmt, 2)),
                "eventLocation" : String(cString: sqlite3_column_text(stmt, 3)),
                "userId" : String(cString: sqlite3_column_text(stmt, 4)),
                
                ]
            eventData.append(EventModel(event: eventDict ))
        }
        return eventData
    }
    
    func getEventDataFromSpecificUser(userId: String)-> [EventModel] {
        createDatabase()
        var userCreatedEvent = [EventModel]()
        var stmt:OpaquePointer?
        let queryString = "SELECT * FROM Events WHERE EventLocation = '\(userId)';"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return userCreatedEvent
        }
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let userCreatedDict:NSDictionary = [
                "eventId" : String(cString: sqlite3_column_text(stmt, 0)),
                "eventTitle" : String(cString: sqlite3_column_text(stmt, 1)),
                "eventDescription" : String(cString: sqlite3_column_text(stmt, 2)),
                "eventLocation" : String(cString: sqlite3_column_text(stmt, 3)),
                "userId" : String(cString: sqlite3_column_text(stmt, 4))
                
                ]
            userCreatedEvent.append(EventModel(event: userCreatedDict ))
        }
        return userCreatedEvent
    }
    
    
    }
    
    


