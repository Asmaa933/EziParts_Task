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
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.shadowColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 6
        self.layer.masksToBounds = false
        
    }
    override func prepareForInterfaceBuilder() {
        setupview()
    }
}
