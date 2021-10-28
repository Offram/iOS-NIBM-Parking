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

enum SlotStatus {
    case available, booked, reserved
}
