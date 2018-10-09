//
//  tblcell.swift
//  HamroProject
//
//  Created by kiran on 10/9/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit

class tblcell: UITableViewCell {
    @IBOutlet weak var userid: UILabel!
        @IBOutlet weak var useremail: UILabel!
    @IBOutlet weak var userfirstam: UILabel!
    @IBOutlet weak var userlastname: UILabel!
    
        @IBOutlet weak var eventid: UILabel!
        @IBOutlet weak var evnttitle: UILabel!
    @IBOutlet weak var useridevent: UILabel!
    @IBOutlet weak var userdesc: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
