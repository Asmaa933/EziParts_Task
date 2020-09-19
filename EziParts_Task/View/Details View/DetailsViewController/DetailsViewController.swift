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

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var carbonView: UIView!
    @IBOutlet weak var logoImg: CircularImage!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var rateView: CosmosView!
    @IBOutlet weak var shadowView: ShadowedView!
    
    var supplierSlug: String?
    lazy var viewModel: DetailsViewModel = {
        return DetailsViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCarbonView()
        initViewModel()
        rateView.settings.fillMode = .precise
        shadowView.layer.cornerRadius = 20

    }
    
    func setupCarbonView(){
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
    
    func initViewModel(){
        viewModel.updateUIClosure = { [weak self] () in
            guard let self = self else {return}
            guard let details = self.viewModel.supplierDetails?.results else {return}
            DispatchQueue.main.async {
                self.companyName.text = details.companyName
                self.logoImg.sd_setImage(with: URL(string: details.logo ?? "") , placeholderImage: #imageLiteral(resourceName: "logo"), completed: nil)
                self.rateView.rating = (Double(details.reviewsAvg ?? "") ?? 0) / 2
                
                
            }
        }
        
        
        
        
        viewModel.getSupplierDetails(slug: supplierSlug ?? "")
        
        
        
        
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func socialMediaButtonsPressed(_ sender: UIButton) {
        
        
    }
}

extension DetailsViewController: CarbonTabSwipeNavigationDelegate{
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        print("xXx: \(index)")
        switch index {
        case 0:
            return InfoViewController()
            
        case 1:
            let reviewController = ReviewsViewController(nibName: "ReviewsViewController", bundle: nil)
            
            return reviewController
            
        default:
            return InfoViewController()
            
        }
        
    }
    
}
