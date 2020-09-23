//
//  DetailsViewController.swift
//  EziParts_Task
//
//  Created by Esma on 9/18/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import UIKit
import CarbonKit
import Cosmos
import SafariServices


class DetailsViewController: UIViewController {
    
    @IBOutlet private weak var carbonView: UIView!
    @IBOutlet private weak var logoImg: CircularImage!
    @IBOutlet private weak var companyName: UILabel!
    @IBOutlet private weak var rateView: CosmosView!
    @IBOutlet private weak var shadowView: ShadowedView!
    
    var supplierSlug: String?
    lazy var viewModel: DetailsViewModel = {
        return DetailsViewModel()
    }()
    private var infoVC = InfoViewController()
    private var reviewVC = ReviewsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        initViewModel()
        
    }
    
    private func setupView(){
        rateView.settings.fillMode = .precise
        shadowView.layer.cornerRadius = 20
        setupCarbonView()
        
    }
    
    private func setupCarbonView(){
        let items = ["Info", "Reviews"]
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.setNormalColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), font:(UIFont(name: "Poppins-Medium", size: 15)) ?? UIFont())
        carbonTabSwipeNavigation.setSelectedColor(#colorLiteral(red: 1, green: 0.4666666667, blue: 0.2235294118, alpha: 1), font: (UIFont(name: "Poppins-Medium", size: 15)) ?? UIFont())
        carbonTabSwipeNavigation.setIndicatorColor(#colorLiteral(red: 1, green: 0.4666666667, blue: 0.2235294118, alpha: 1))
        carbonTabSwipeNavigation.insert(intoRootViewController: self, andTargetView: carbonView)
        carbonTabSwipeNavigation.toolbar.barTintColor = .white
        var frameRect: CGRect = carbonTabSwipeNavigation.carbonSegmentedControl?.frame ?? CGRect()
        frameRect.size.width = UIScreen.main.bounds.size.width
        carbonTabSwipeNavigation.carbonSegmentedControl?.frame = frameRect
        carbonTabSwipeNavigation.carbonSegmentedControl?.apportionsSegmentWidthsByContent = false
    }
    
    private func initViewModel(){
        viewModel.updateUIClosure = { [weak self] () in
            guard let self = self else {return}
            guard let details = self.viewModel.supplierDetails?.results else {return}
            self.infoVC.infoDetails = details
            guard let reviews = self.viewModel.supplierDetails?.results?.reviews else {return}
            self.reviewVC.reviews = reviews
            DispatchQueue.main.async {
                self.companyName.text = details.companyName
                self.logoImg.sd_setImage(with: URL(string: details.logo ?? "") , placeholderImage: #imageLiteral(resourceName: "logo"), completed: nil)
                self.rateView.rating = (Double(details.reviewsAvg ?? "") ?? 0) / 2
            }
        }
        viewModel.showAlertClosure = { [weak self] () in
            DispatchQueue.main.async {
                if let message = self?.viewModel.alertMessage {
                    if message == "Check Internet Connection"{
                        //  self?.noInternetImg.isHidden = false
                    }else{
                        //self?.noInternetImg.isHidden = true
                        self?.present(showAlert(message), animated: true, completion: nil)
                    }
                }
            }
        }
        
        viewModel.getSupplierDetails(slug: supplierSlug ?? "")
        
    }
    
    @IBAction private func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func socialMediaButtonsPressed(_ sender: UIButton) {
        var linkURL = ""
        switch sender.tag {
        case 0: //facebook
            linkURL = viewModel.supplierDetails?.results?.facebook ?? ""
        case 1: // Instagram
            linkURL = viewModel.supplierDetails?.results?.instagram ?? ""
        case 2: //Twitter
            linkURL = viewModel.supplierDetails?.results?.twitter ?? ""
        default:
            break
        }
        if linkURL.lowercased().hasPrefix("http://")==false{
            linkURL = "http://" + linkURL
        }
        guard let url = URL(string: linkURL) else { return }
        let svc = SFSafariViewController(url: url)
        svc.modalPresentationStyle = .popover
        present(svc, animated: true, completion: nil)
    }
}

extension DetailsViewController: CarbonTabSwipeNavigationDelegate{
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        switch index {
        case 0:
            return infoVC
            
        case 1:
            return reviewVC
            
        default:
            return infoVC 
            
        }
        
    }
    
}
