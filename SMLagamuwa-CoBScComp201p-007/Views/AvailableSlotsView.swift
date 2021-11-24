//
//  AvailableSlotsView.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 10/27/21.
//

import SwiftUI

struct AvailableSlotsView: View {
    
    @Binding var tabSelection: Int
    @StateObject var viewModel = AvailableSlotsViewModel()
    
    var body: some View {
        GeometryReader { g in
            VStack {
                TabTitleText("Available Slots")
                
                List(viewModel.slotUnits) { item in
                    VStack (alignment: .leading) {
                        Button(action: {
                            self.tabSelection = 2
                        }) {
                            SlotUnitView(
                                slotNumber: item.slotID,
                                vip: item.vip,
                                vehicleNo: item.vehicleNo,
                                slotStatus: item.slotStatus)
                        }
                        .disabled(item.slotStatus != SlotStatus.available)
                    }
                    .listRowBackground(viewModel.getStatusColor(status: item.slotStatus))
                }
                
            }
            .frame( height: g.size.height - 1, alignment: .center)
        }
        .onAppear() {
            viewModel.getSlots();
        }
    }
}

struct AvailableSlotsView_Previews: PreviewProvider {
    @State static private var tabSelection = 1
    static var previews: some View {
        AvailableSlotsView(tabSelection: $tabSelection)
    }
}
