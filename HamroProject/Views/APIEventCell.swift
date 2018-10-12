//
//  APIEventCell.swift
//  HamroProject
//
//  Created by kiran on 10/12/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit

class APIEventCell: UITableViewCell {

    @IBOutlet weak var eventImage: UIImageView!
       @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDesc: UILabel!
       @IBOutlet weak var eventLocation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
