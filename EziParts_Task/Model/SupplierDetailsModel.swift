//
//  SupplierDetailsModel.swift
//  EziParts_Task
//
//  Created by Esma on 9/19/20.
//  Copyright © 2020 Esma. All rights reserved.
//

import Foundation

// MARK: - SupplierDetails
struct SupplierDetails: Codable {
    let status: Statuss
    let results: Results
}

// MARK: - Results
struct Results: Codable {
    let id: Int
    let companyPhone, companyName, companyEmail: String
    let location: [Location]
    let logo: String
    let about, building, address, facebook: String
    let instagram, twitter, slug: String
    let addressDetails: String
    let favorite, reviewsCount: Int
    let reviewsAvg: String
    let reviews: [Review]

    enum CodingKeys: String, CodingKey {
        case id
        case companyPhone = "company_phone"
        case companyName = "company_name"
        case companyEmail = "company_email"
        case location, logo, about, building, address, facebook, instagram, twitter, slug
        case addressDetails = "address_details"
        case favorite
        case reviewsCount = "reviews_count"
        case reviewsAvg = "reviews_avg"
        case reviews
    }
}

// MARK: - Location
struct Location: Codable {
    let lat, lng: String
}

// MARK: - Review
struct Review: Codable {
    let id: Int
    let rating, details, createdAt, user: String

    enum CodingKeys: String, CodingKey {
        case id, rating, details
        case createdAt = "created_at"
        case user
    }
}

// MARK: - Status
struct Statuss: Codable {
    let code: Int
    let message: String
}
