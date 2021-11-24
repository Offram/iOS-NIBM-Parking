//
//  SlotUnitView.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 10/28/21.
//

import SwiftUI

struct SlotUnitView: View {
    var slotNumber = "0";
    var vip = false;
    var vehicleNo: String = "sss";
    var slotStatus = SlotStatus.booked;
    
    
    var body: some View {
        HStack {
            
            Text("Slot \(slotNumber) ").foregroundColor(getForegroundColor(status: slotStatus))
            Spacer()
            if(!vehicleNo.isEmpty) {
                Text(vehicleNo)
                    .foregroundColor(Color.black)
                Spacer()
            }
            if(vip){
                Text("VIP")
                    .bold()
                    .font(.system(size: 12))
                    .foregroundColor(Color.black)
            }
        }
    }
    
    private func getForegroundColor(status: SlotStatus) -> Color {
        if(status == SlotStatus.reserved) {
            return Color.black
        }
        
        return Color.white
    }
}

struct SlotUnitView_Previews: PreviewProvider {
    static var previews: some View {
        SlotUnitView()
    }
}
