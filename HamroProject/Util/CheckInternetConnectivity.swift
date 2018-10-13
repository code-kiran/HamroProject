//
//  CheckInternetConnectivity.swift
//  HamroProject
//
//  Created by kiran on 10/13/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import Foundation
import Alamofire

class CheckInternetConnection {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }

}
