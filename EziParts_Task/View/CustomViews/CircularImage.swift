//
//  CircularImage.swift
//  EziParts_Task
//
//  Created by Esma on 9/19/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import UIKit

class CircularImage: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setupview()
    }
    
    private func setupview(){
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2.0
    }
    
    override func prepareForInterfaceBuilder() {
        setupview()
    }
}

