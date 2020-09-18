//
//  HomeViewModel.swift
//  EziParts_Task
//
//  Created by Esma on 9/18/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import Foundation

class HomeViewModel{
    private var suppliers: SuppliersModel?
    
    func getSuppliers() {
        NetworkHandler.instance.getSuppliers({[weak self](suppliersData) in
            if suppliersData != nil{
                self?.suppliers = suppliersData!
                self?.reloadTableView()
            }
        }) {[weak self] (error) in
            self?.showError(error: error)
        }
    }
    
    func getSuppliersArrCount() -> Int?{
        return suppliers?.results.count
    }
    
    func getSupplierData(indexPath: IndexPath) -> Result?{
        return suppliers?.results[indexPath.row]
    }
    
    private func reloadTableView(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "suppliers"), object: nil)
        
    }
    private func showError(error: String){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "error"), object: nil, userInfo: ["error" : error])
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
