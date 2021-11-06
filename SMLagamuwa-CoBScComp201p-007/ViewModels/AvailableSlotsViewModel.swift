//
//  AvailableSlotsViewModel.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 10/28/21.
//

import Foundation
import SwiftUI

class AvailableSlotsViewModel: ObservableObject {
    
    @Published var slots = [SlotModel]()
    @Published var slotUnits = [SlotUnit]()
    
    var slotArray = [
        SlotUnit(slotID:"One", vip: true, slotStatus: SlotStatus.available),
        SlotUnit(slotID:"Two", vip: true, slotStatus: SlotStatus.available),
        SlotUnit(slotID:"Three", vip: true, slotStatus: SlotStatus.booked),
        SlotUnit(slotID:"Four", vip: true, slotStatus: SlotStatus.reserved),
        SlotUnit(slotID:"Five", vip: false, slotStatus: SlotStatus.available),
        SlotUnit(slotID:"Six", vip: false, slotStatus: SlotStatus.available),
        SlotUnit(slotID:"Seven", vip: false, slotStatus: SlotStatus.booked),
        SlotUnit(slotID:"Eight", vip: false, slotStatus: SlotStatus.available),
        SlotUnit(slotID:"Nine", vip: false, slotStatus: SlotStatus.available),
        SlotUnit(slotID:"Ten", vip: false, slotStatus: SlotStatus.reserved),
        SlotUnit(slotID:"Eleven", vip: false, slotStatus: SlotStatus.available),
        SlotUnit(slotID:"Twelve", vip: false, slotStatus: SlotStatus.available),
    ]
    
    func getSlots() {
        API().getSlots { (slot) in
            self.slots = slot
            self.slotUnits = self.slots.map{ slot in
                var slotType:Bool
                
                switch (slot.type) {
                case "VIP":
                    slotType = true;
                    break;
                default:
                    slotType = false;
                }
                
                var slotStatus: SlotStatus;
                
                switch (slot.status) {
                case "AVAILABLE":
                    slotStatus = SlotStatus.available;
                    break;
                case "RESERVED":
                    slotStatus = SlotStatus.reserved;
                    break;
                case "BOOKED":
                    slotStatus = SlotStatus.booked;
                    break;
                default:
                    slotStatus = SlotStatus.booked;
                }
                
                return SlotUnit(slotID: slot.slotID, vip: slotType, slotStatus: slotStatus)
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