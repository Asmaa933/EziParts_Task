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
    }

    
    var review: Review?{
        didSet{
            dateLbl.text = review?.createdAt
            rateView.rating = (Double(review?.rating ?? "") ?? 0)
            reviewDetails.text = review?.details
        }
    }
    
}
