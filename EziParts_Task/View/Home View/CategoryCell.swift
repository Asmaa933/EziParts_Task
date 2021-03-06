//
//  CategoryCell.swift
//  EziParts_Task
//
//  Created by Esma on 9/24/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet private weak var bgView: UIView!
    
    
    @IBOutlet private weak var categoryButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupview()
        
    }
    private func setupview(){
        bgView.layer.cornerRadius = 5
        bgView.backgroundColor = .clear
        categoryButton.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 15)
        categoryButton.setTitleColor(#colorLiteral(red: 0.631372549, green: 0.662745098, blue: 0.7647058824, alpha: 1), for: .normal)
        categoryButton.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9490196078, blue: 0.9607843137, alpha: 1)
        categoryButton.layer.cornerRadius = 5
        categoryButton.clipsToBounds = true
        
    }
    
    var buttonText: String?{
        didSet{
            categoryButton.setTitle(buttonText, for: .normal)
        }
    }
}
