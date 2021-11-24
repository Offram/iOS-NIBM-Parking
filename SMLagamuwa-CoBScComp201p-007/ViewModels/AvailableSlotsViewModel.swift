//
//  AvailableSlotsViewModel.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 10/28/21.
//

import Foundation
import SwiftUI

class AvailableSlotsViewModel: ObservableObject {
    
    @Published var slotUnits = [SlotUnit]()
    
    var slotArray = [
        SlotUnit(slotID:"One", vip: true, slotStatus: SlotStatus.available, vehicleNo: "AAA-9999"),
        SlotUnit(slotID:"Two", vip: true, slotStatus: SlotStatus.available, vehicleNo: "AAA-9999"),
        SlotUnit(slotID:"Three", vip: true, slotStatus: SlotStatus.booked, vehicleNo: "AAA-9999"),
        SlotUnit(slotID:"Four", vip: true, slotStatus: SlotStatus.reserved, vehicleNo: "AAA-9999"),
        SlotUnit(slotID:"Five", vip: false, slotStatus: SlotStatus.available, vehicleNo: "AAA-9999"),
        SlotUnit(slotID:"Six", vip: false, slotStatus: SlotStatus.available, vehicleNo: "AAA-9999"),
        SlotUnit(slotID:"Seven", vip: false, slotStatus: SlotStatus.booked, vehicleNo: "AAA-9999"),
        SlotUnit(slotID:"Eight", vip: false, slotStatus: SlotStatus.available, vehicleNo: "AAA-9999"),
        SlotUnit(slotID:"Nine", vip: false, slotStatus: SlotStatus.available, vehicleNo: "AAA-9999"),
        SlotUnit(slotID:"Ten", vip: false, slotStatus: SlotStatus.reserved, vehicleNo: "AAA-9999"),
        SlotUnit(slotID:"Eleven", vip: false, slotStatus: SlotStatus.available, vehicleNo: "AAA-9999"),
        SlotUnit(slotID:"Twelve", vip: false, slotStatus: SlotStatus.available, vehicleNo: "AAA-9999"),
    ]
    
    func getSlots() {
        API().getSlots { (slots) in
            self.slotUnits = slots.map{ slot in
                var slotType:Bool
                
                switch (slot.type) {
                case "VIP":
                    slotType = true;
                    break;
                default:
                    slotType = false;
                }
                
                let slotStatus: SlotStatus = SlotStatusString().getSlotStatusFromString(status: slot.status)
                
                return SlotUnit(slotID: String(slot.slotID), vip: slotType, slotStatus: slotStatus, vehicleNo: slot.vehicleNo)
            }
        }
        
        
    }
    
    func getStatusColor(status: SlotStatus) -> Color {
        switch status {
        case .available:
            return Color.green
        case .reserved:
            return Color.yellow
        case .booked:
            return Color.red
        }
    }
}
