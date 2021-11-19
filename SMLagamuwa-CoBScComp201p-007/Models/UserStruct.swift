//
//  UserStruct.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/10/21.
//

import Foundation

struct UserModel: Codable, Identifiable {
    let id: String
    let email: String
    let name: String
    let vehicleNo: String
    let nibmId: String
    let nic: String
    
    init(email: String, name: String, vehicleNo: String, nibmId: String, nic: String) {
        self.email = email
        self.name = name
        self.vehicleNo = vehicleNo
        self.nibmId = nibmId
        self.nic = nic
        self.id = "5"
    }
    
    init(id: String, email: String, name: String, vehicleNo: String, nibmId: String, nic: String) {
        self.email = email
        self.name = name
        self.vehicleNo = vehicleNo
        self.nibmId = nibmId
        self.nic = nic
        self.id = id
    }
    
    func getKeys() -> [String] {
        return ["id", "email", "name", "vehicleNo", "nibmId", "nic"];
    }
}
