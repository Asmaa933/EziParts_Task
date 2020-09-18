//
//  ShadowedView.swift
//  EziParts_Task
//
//  Created by Esma on 9/18/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import UIKit

class ShadowedView: UIView {
    
    
        
        override func awakeFromNib() {
            super.awakeFromNib()
            setupview()
        }
        private func setupview(){
            self.clipsToBounds = true
            self.layer.shadowColor = #colorLiteral(red: 0.4784313725, green: 0.4784313725, blue: 0.5098039216, alpha: 1)
            self.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.layer.shadowOpacity = 0.2
            self.layer.shadowRadius = 6
            self.layer.masksToBounds = false
        }
        override func prepareForInterfaceBuilder() {
            setupview()
        }
    }

