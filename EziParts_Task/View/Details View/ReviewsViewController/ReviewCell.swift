//
//  ReviewCell.swift
//  EziParts_Task
//
//  Created by Esma on 9/19/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import UIKit
import Cosmos

class ReviewCell: UITableViewCell {
    @IBOutlet weak var userName: UILabel!
    
   
    @IBOutlet weak var rateView: CosmosView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var reviewDetails: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
