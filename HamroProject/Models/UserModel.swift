//
//  UserModel.swift
//  HamroProject
//
//  Created by kiran on 10/9/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import Foundation

class UserModel {
    var firstName: String?
    var lastName: String?
    var userName: String?
    var email: String?
    var password: String?
    var confirmPassword: String?
    
    init(user: NSDictionary) {
        self.firstName = user["firstName"] as? String
        self.lastName = user["lastName"] as? String
        self.userName = user["userName"] as? String
        self.email = user["email"] as? String
        self.password = user["password"] as? String
        self.confirmPassword = user["confirmPassword"] as? String
        
    }
    
    
    
    
    
}
