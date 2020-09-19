//
//  DetailsViewController.swift
//  EziParts_Task
//
//  Created by Esma on 9/18/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import UIKit
import CarbonKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var carbonView: UIView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCarbonView()
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
