//
//  AvailableSlotsView.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 10/27/21.
//

import SwiftUI

struct AvailableSlotsView: View {
    
    @StateObject var viewModel = AvailableSlotsViewModel()
    
    var body: some View {
        VStack {
            TabTitleText("Available Slots")
            List(viewModel.slotUnits) { item in
                VStack (alignment: .leading) {
                    SlotUnitView(slotNumber: item.slotID, vip: item.vip, slotStatus: item.slotStatus)
                }.listRowBackground(viewModel.getStatusColor(status: item.slotStatus))
            }
        }
        .onAppear() {
            viewModel.getSlots();
        }
    }
}

struct AvailableSlotsView_Previews: PreviewProvider {
    static var previews: some View {
        AvailableSlotsView()
    }
}
