//
//  SuppliersModel.swift
//  EziParts_Task
//
//  Created by Esma on 9/18/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import Foundation

// MARK: - SuppliersModel
struct SuppliersModel: Codable {
    let status: Status
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let companyName: String
    let logo: String
    let address, building, slug: String
    let favorite, reviewsCount: Int
    let reviewsAvg: String

    enum CodingKeys: String, CodingKey {
        case id
        case companyName = "company_name"
        case logo, address, building, slug, favorite
        case reviewsCount = "reviews_count"
        case reviewsAvg = "reviews_avg"
    }
}

// MARK: - Status
struct Status: Codable {
    let code: Int
    let message: String
}
