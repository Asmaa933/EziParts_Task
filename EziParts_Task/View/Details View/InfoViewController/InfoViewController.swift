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
        aboutUSLbl.font = UIFont(name: "Poppins-Regular", size: 16)
        aboutTextView.font = UIFont(name: "Poppins-Regular", size: 15)
        contactUsLbl.font = UIFont(name: "Poppins-Regular", size: 16)
        locationLbl.font = UIFont(name: "Poppins-Regular", size: 15)
        phoneLbl.font = UIFont(name: "Poppins-Regular", size: 14)
        emailLbl.font = UIFont(name: "Poppins-Regular", size: 14)
        mapImage.layer.cornerRadius = 10
        
    }
    private func reloadUI(){
        guard let infoDetails = infoDetails else {return}
        self.aboutTextView.text = infoDetails.about ?? "\n\t\t\t\t\tNot Found"
        self.locationLbl.text = infoDetails.address ?? ""
        self.phoneLbl.text = infoDetails.companyPhone
        self.emailLbl.text = infoDetails.companyEmail
        guard let lat = infoDetails.location?.first?.lat else {return}
        guard let lang = infoDetails.location?.first?.lng else {return}
        
        
        
        
        let url = "https://maps.googleapis.com/maps/api/staticmap?center=\(lat),\(lang)&zoom=6&size=400x160&markers=color:0x01737E%7C%7C\(lat),\(lang)&key=AIzaSyCAg3MSLbUKNq7bGtjciTuxMPUVmEbJMO0"
        
        self.mapImage.sd_setImage(with: URL(string: url), completed: nil)
    }
    
}
