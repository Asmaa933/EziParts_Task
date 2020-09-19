//
//  Helping Methods.swift
//  EziParts_Task
//
//  Created by Esma on 9/18/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import Foundation
import UIKit

func showActivityIndicator(view: UIView) -> UIActivityIndicatorView{
    let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    activityIndicator.color = #colorLiteral(red: 0.1647058824, green: 0.168627451, blue: 0.2901960784, alpha: 0.8474154538)
    activityIndicator.center = view.center
    activityIndicator.startAnimating()
    view.addSubview(activityIndicator)
    return activityIndicator
}

func removeActivityIndicator(activityIndicator: UIActivityIndicatorView){
    activityIndicator.stopAnimating()
    activityIndicator.removeFromSuperview()
    
}
func showAlert(_ message: String) -> UIAlertController{
    let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
    alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
    return alert
    
}
