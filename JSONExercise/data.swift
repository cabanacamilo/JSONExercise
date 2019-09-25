//
//  data.swift
//  JSONExercise
//
//  Created by Camilo Cabana on 9/23/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import Foundation

struct UserInfo: Decodable {
    var email: String
    var id: Int
    var name: String
    var phone: String
    var company: CompanyInfo
    var address: AddressInfo
}

struct CompanyInfo: Decodable {
    var name: String
    var catchPhrase: String
}

struct AddressInfo: Decodable {
    var street: String
    var suite: String
    var zipcode: String
}
