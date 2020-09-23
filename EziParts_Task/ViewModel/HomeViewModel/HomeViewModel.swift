//
//  HomeViewModel.swift
//  EziParts_Task
//
//  Created by Esma on 9/18/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import Foundation

class HomeViewModel{
    
    private let apiService: SuppliersApiHandlerProtocol
    var updateUIClosure: (()->())?
    var showAlertClosure: (()->())?
    var updateLoadingStatus: (()->())?
    
    private var filteredArr: [Result]?{
        didSet{
            self.updateUIClosure?()
        }
    }
    private var suppliers: SuppliersModel?{
        didSet{
            self.updateUIClosure?()
        }
    }
    
    var isFiltered = false
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    var state: State = .empty {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    init(apiService: SuppliersApiHandlerProtocol = SuppliersApiHandler()) {
        self.apiService = apiService
    }
    
    func getSuppliers() {
        state = .loading
        if ReachabilityManager.isConnectedToNetwork(){
            getSuppliersFromApi()
        }else{
            alertMessage = "Check Internet Connection"
            state = .error
        }
    }
    
    private func getSuppliersFromApi(){
        apiService.getSuppliers({[weak self](suppliersData) in
            if suppliersData != nil{
                self?.suppliers = suppliersData!
                self?.state = .populated
            }
        }) {[weak self] (error) in
            self?.alertMessage = error
            self?.state = .error
        }
    }
    
    func getSuppliersArrCount() -> Int?{
        
        return !isFiltered ? suppliers?.results.count: filteredArr?.count
    }
    
    func getSupplierData(indexPath: IndexPath) -> Result?{
        return !isFiltered ? suppliers?.results[indexPath.row] : filteredArr?[indexPath.row]
    }
    
    func searchInArray(searchTxt: String){
        filteredArr = [Result]()
        if (searchTxt.isEmpty){
            isFiltered = false
        }else{
            isFiltered = true
            filteredArr = suppliers?.results.filter {
                return $0.companyName.range(of: searchTxt, options: .caseInsensitive) != nil
            }
        }
    }
}
