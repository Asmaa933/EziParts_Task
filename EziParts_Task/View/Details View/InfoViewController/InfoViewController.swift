//
//  InfoViewController.swift
//  EziParts_Task
//
//  Created by Esma on 9/19/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet private weak var aboutUSLbl: UILabel!
    @IBOutlet private weak var aboutTextView: UITextView!
    @IBOutlet private weak var contactUsLbl: UILabel!
    @IBOutlet private weak var locationLbl: UILabel!
    @IBOutlet private weak var phoneLbl: UILabel!
    @IBOutlet private weak var emailLbl: UILabel!
    @IBOutlet private weak var mapImage: UIImageView!
    
    var infoDetails: Results? {
        didSet{
        reloadUI()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    private func setupView(){
        aboutUSLbl.font = UIFont(name: "Poppins-Regular", size: 15)
        aboutTextView.font = UIFont(name: "Poppins-Regular", size: 12)
        contactUsLbl.font = UIFont(name: "Poppins-Regular", size: 15)
        locationLbl.font = UIFont(name: "Poppins-Regular", size: 12)
        phoneLbl.font = UIFont(name: "Poppins-Regular", size: 12)
        emailLbl.font = UIFont(name: "Poppins-Regular", size: 12)
        
        
    }
    private func reloadUI(){
        guard let infoDetails = infoDetails else {return}
                self.aboutTextView.text = infoDetails.about ?? "\n\t\t\t\t\tNot Found"
                self.locationLbl.text = infoDetails.address ?? ""
                self.phoneLbl.text = infoDetails.companyPhone
                self.emailLbl.text = infoDetails.companyEmail
                
            }
        }
