//
//  HomeCell.swift
//  EziParts_Task
//
//  Created by Esma on 9/18/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import UIKit
import Cosmos
import SDWebImage

class HomeCell: UITableViewCell {
    
    @IBOutlet private weak var bgView: ShadowedView!
    @IBOutlet private weak var companyName: UILabel!
    @IBOutlet private weak var companyLogo: UIImageView!
    @IBOutlet private weak var rateView: CosmosView!
    @IBOutlet private weak var reviewsNum: UILabel!
    @IBOutlet private weak var companyAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        
    }
    
    private func setupView(){
        companyName.font = UIFont(name: "Poppins-Medium", size: 15)
        reviewsNum.font = UIFont(name: "Poppins-Regular", size: 14)
        reviewsNum.textColor = #colorLiteral(red: 0.631372549, green: 0.662745098, blue: 0.7647058824, alpha: 1)
        companyAddress.font = UIFont(name: "Poppins-Regular", size: 14)
        companyAddress.textColor = #colorLiteral(red: 0.2156862745, green: 0.2745098039, blue: 0.3803921569, alpha: 1)
        bgView.layer.cornerRadius = 10
        
    }
    func configureCell(suppliers: Result?){
        if suppliers != nil{
            companyName.text = suppliers?.companyName
            companyLogo.sd_setImage(with: URL(string: suppliers!.logo), completed: nil)
            reviewsNum.text = "\(suppliers!.reviewsCount) reviews"
            companyAddress.text = suppliers?.address
            rateView.settings.fillMode = .precise
            rateView.rating = (Double(suppliers!.reviewsAvg) ?? 0) / 2
            
        }
    }
    
}

