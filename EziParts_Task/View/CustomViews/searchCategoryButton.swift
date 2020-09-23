//
//  searchCategoryButton.swift
//  EziParts_Task
//
//  Created by Esma on 9/18/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import UIKit

class searchCategoryButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupview()
    }
    private func setupview(){
        self.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 12)
        self.titleLabel?.textColor = #colorLiteral(red: 0.631372549, green: 0.662745098, blue: 0.7647058824, alpha: 1)
        self.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9490196078, blue: 0.9607843137, alpha: 1)
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
    }
    override func prepareForInterfaceBuilder() {
        setupview()
    }
}
