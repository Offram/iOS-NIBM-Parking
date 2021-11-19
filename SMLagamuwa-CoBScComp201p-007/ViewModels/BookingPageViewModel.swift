//
//  BookingPageViewModel.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/7/21.
//

import Foundation
import SwiftUI

class BookingPageViewModel: ObservableObject {
    
    @Published var availableSlotUnits = [SlotUnit]()
    
    func getAvailableSlots() {
        API().getAvailableSlots { (slot) in
            self.availableSlotUnits = slot.map{ slot in
                var slotType:Bool
                
                switch (slot.type) {
                case "VIP":
                    slotType = true;
                    break;
                default:
                    slotType = false;
                }
                
                let slotStatus: SlotStatus = SlotStatusString().getSlotStatusFromString(status: slot.status)
                
                return SlotUnit(slotID: String(slot.slotID), vip: slotType, slotStatus: slotStatus)
            }
        }
    }
}
