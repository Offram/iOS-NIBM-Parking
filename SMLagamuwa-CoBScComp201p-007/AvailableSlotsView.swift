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
            Text("Available Slots")
            List(viewModel.slotArray) { item in
                VStack (alignment: .leading) {
                    SlotUnitView(slotNumber: item.slotID, vip: item.vip, slotStatus: item.slotStatus)
                }.listRowBackground(viewModel.getStatusColor(status: item.slotStatus))
            }
        }
//        LazyVStack {
//            ForEach(1...10, id: \.self) { count in
//                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Placeholder \(count)")/*@END_MENU_TOKEN@*/
//            }
//        }
        
    }
}

struct AvailableSlotsView_Previews: PreviewProvider {
    static var previews: some View {
        AvailableSlotsView()
    }
}
