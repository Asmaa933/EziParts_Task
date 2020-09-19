//
//  ShadowedButton.swift
//  EziParts_Task
//
//  Created by Esma on 9/18/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import UIKit

class ShadowedButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupview()
    }
    private func setupview(){
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = false
        self.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 12)
    }
    override func prepareForInterfaceBuilder() {
        setupview()
    }
}
