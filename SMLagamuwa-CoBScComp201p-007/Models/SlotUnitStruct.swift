//
//  SlotUnitStruct.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 10/28/21.
//

import Foundation

struct SlotUnit: Identifiable {
    let id = UUID()
    let slotID: String
    let vip: Bool
    let slotStatus: SlotStatus
}

struct SlotModel: Codable, Identifiable {
    let id: String
    let slotID: String
    let status: String
    let type: String
    let userID: String
    let vehicleNo: String
    
    func getKeys() -> [String] {
        return ["slotID", "status", "type", "userID", "vehicleNo"];
    }
}

enum SlotStatus {
    case available, booked, reserved
}

struct SlotStatusString {
    let reserved = "RESERVED";
    let booked = "BOOKED";
    let available = "AVAILABLE"
}
