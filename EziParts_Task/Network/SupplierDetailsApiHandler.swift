//
//  SupplierDetailsApiHandler.swift
//  EziParts_Task
//
//  Created by Esma on 9/19/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import Foundation
import Alamofire

protocol SupplierDetailsApiHandlerProtocol {
    func getSupplierDetail(supplierSlug: String,_ completion: @escaping(_ details: SupplierDetails?)->Void,_ errorCompletion: @escaping (_ error: String)->Void)
}

class SupplierDetailsApiHandler: SupplierDetailsApiHandlerProtocol{
    func getSupplierDetail(supplierSlug: String,_ completion: @escaping(_ details: SupplierDetails?)->Void,_ errorCompletion: @escaping (_ error: String)->Void){
        let detailUrl = "http://eziparts.innsandbox.com/api/supplier/profile?supplier_slug=\(supplierSlug)"
        guard let url = URL(string: detailUrl) else{return}
        
        AF.request(url).responseJSON { (response) in
            switch response.result{
            case .success:
                do{
                    if response.data != nil{
                        let supplierDetail =  try JSONDecoder().decode(SupplierDetails.self, from: response.data!)
                        completion(supplierDetail)
                    }
                }catch(let error){
                    print(error.localizedDescription.description)
                    errorCompletion(error.localizedDescription.description)
                }
                
            case .failure(let error):
                print(error.localizedDescription.description)
                errorCompletion(error.localizedDescription.description)
            }
        }
    }
}
