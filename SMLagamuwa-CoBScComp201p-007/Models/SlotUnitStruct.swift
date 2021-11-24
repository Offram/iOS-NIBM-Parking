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
    let vehicleNo: String
}

struct SlotModel: Codable, Identifiable {
    let id: String
    let slotID: Int
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
    
    func getSlotStatusFromString(status: String) -> SlotStatus {
        var slotStatus: SlotStatus;
        
        switch (status) {
        case available:
            slotStatus = SlotStatus.available;
            break;
        case reserved:
            slotStatus = SlotStatus.reserved;
            break;
        case booked:
            slotStatus = SlotStatus.booked;
            break;
        default:
            slotStatus = SlotStatus.booked;
        }
        
        return slotStatus
    }
}
