//
//  EventCell.swift
//  HamroProject
//
//  Created by kiran on 10/11/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
  
    @IBOutlet weak var eventTitleLable: UILabel!
    @IBOutlet weak var eventDescLable: UILabel!
    @IBOutlet weak var eventCreatedByLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
