//
//  Home.swift
//  HamroProject
//
//  Created by kiran on 10/11/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit
import Alamofire

class Home: UIViewController {
    
    @IBOutlet weak var activityIndicatorView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    let baseUrl = "http://api.yeahviva.com/Events/getEventListingForWheel.json"
    let token:[String: Any] = ["token": "i3rq9jj9f2wy42bxldknnzr7o77pyzfi87yx0gjm"]
    var eventArray = [APIEventModel]()
    
    @IBOutlet weak var homeTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfLogined()
        homeTable.delegate = self
        homeTable.dataSource = self
        getData(fromUrl: baseUrl)
        navigationItem.title = UserDefaults.standard.value(forKey: "userName") as? String
          self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Menlo", size: 18)!]
            }
    
    func getData(fromUrl: String) {
        Alamofire.request(fromUrl, method: .post, parameters: token, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            let responseData = response.result.value as? [String: Any]
            let dataOutput = responseData!["output"] as? [String: Any]
            let events = dataOutput!["response"] as? NSArray
            if events != nil {
                for event in events!  {
                    self.eventArray.append(APIEventModel(eventJson: event as! NSDictionary))
                }
                self.activityIndicator.startAnimating()
                DispatchQueue.main.async {
                    self.homeTable.reloadData()
                }
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                  self.activityIndicatorView.isHidden = true
            }
        }
    }
    
    
    
    
    @IBAction func logOutButton(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "islogin")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Login") as! Login
       self.present(newViewController, animated: true, completion: nil)
        
    }
    
    
    func checkIfLogined() {
        if  UserDefaults.standard.bool(forKey: "islogin"){
        } else {
            print("throw to login page")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "Login") as! Login
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.window!.rootViewController = newViewController
        }
        
    }
    
    
}

extension Home: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if   let cell = tableView.dequeueReusableCell(withIdentifier: "APIEventCell", for: indexPath) as? APIEventCell {
            let event = eventArray[indexPath.row]
            cell.eventTitle.text = event.eventName
            cell.eventDesc.text = event.eventDescription
            cell.eventLocation.text = event.eventPrice
            cell.eventImage.downloadImages(url: event.mainImage!)
            return cell
            
        } else {
            return APIEventCell()
        }
        

    }
    
    
    
    
    
    
}
