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
        setupFonts()
    }
    
    private func setupFonts(){
        dateLbl.font = UIFont(name: "Poppins-Regular", size: 13)
        reviewDetails.font = UIFont(name: "Poppins-Regular", size: 14)
        userName.font = UIFont(name: "Poppins-Medium", size: 17)
        reviewDetails.textColor = #colorLiteral(red: 0.2156862745, green: 0.2745098039, blue: 0.3803921569, alpha: 1)
        dateLbl.textColor = #colorLiteral(red: 0.631372549, green: 0.662745098, blue: 0.7647058824, alpha: 1)
    }
    
    
    var review: Review?{
        didSet{
            dateLbl.text = review?.createdAt
            rateView.rating = (Double(review?.rating ?? "") ?? 0)
            reviewDetails.text = review?.details
            userName.text = review?.user
        }
    }
    
}
