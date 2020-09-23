//
//  DetailsViewModel.swift
//  EziParts_Task
//
//  Created by Esma on 9/18/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import Foundation

class DetailsViewModel{
    private let apiService: SupplierDetailsApiHandlerProtocol
    var updateUIClosure: (()->())?
    var showAlertClosure: (()->())?
    var updateLoadingStatus: (()->())?
    init(apiService: SupplierDetailsApiHandlerProtocol = SupplierDetailsApiHandler()) {
        self.apiService = apiService
    }
    var supplierDetails: SupplierDetails?{
        didSet{
            updateUIClosure?()
        }
    }
    
    var alertMessage: String?{
        didSet{
            showAlertClosure?()
        }
    }
    
    func getSupplierDetails(slug: String){
        apiService.getSupplierDetail(supplierSlug: slug, {[weak self] (supplier) in
            if supplier != nil{
                self?.supplierDetails = supplier!
            }
        }) {[weak self] (error) in
            self?.alertMessage = error
        }
    }
}
