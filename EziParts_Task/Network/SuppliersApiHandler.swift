//
//  NetworkHandler.swift
//  EziParts_Task
//
//  Created by Esma on 9/18/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import Foundation
import Alamofire

protocol SuppliersApiHandlerProtocol {
    func getSuppliers(_ completion: @escaping (_ suppliers: SuppliersModel?) -> Void, _ errorCompletion: @escaping (_ error: String) -> Void)
    
}

class SuppliersApiHandler: SuppliersApiHandlerProtocol{
    func getSuppliers(_ completion: @escaping (_ suppliers: SuppliersModel?) -> Void, _ errorCompletion: @escaping (_ error: String) -> Void){
        let supplierUrl = "http://eziparts.innsandbox.com/api/list/suppliers"
        guard let url = URL(string: supplierUrl) else{return}
        AF.request(url).responseJSON { (response) in
            switch response.result{
            case .success:
                do{
                    if response.data != nil{
                        let suppliers =  try JSONDecoder().decode(SuppliersModel.self, from: response.data!)
                        completion(suppliers)
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
