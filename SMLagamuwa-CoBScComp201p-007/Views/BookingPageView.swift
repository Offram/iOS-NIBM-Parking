//
//  BookingPageView.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/6/21.
//

import SwiftUI

struct BookingPageView: View {
    
    @EnvironmentObject var signInviewModel: SignInViewModel
    
    @State var selection: String = "null"
    @StateObject var viewModel = BookingPageViewModel()
    @State var isScanQRActive = false
    @State var isReserveViewActive = false
    
    
    var body: some View {
        
        
        VStack {
            
            Group {
                TabTitleText("Booking")
                HStack {
                    Text(signInviewModel.user?.nibmId ?? "")
                        .padding()
                    Spacer()
                    Text(signInviewModel.user?.vehicleNo ?? "")
                        .padding()
                }
                .padding()
                
                Rectangle().fill(Color.blue).frame(width: 250, height: 2, alignment: .center).padding();
            }
            
            Group {
                HStack {
                    Text("Slot: ")
                    Picker(
                        selection: $selection,
                        label: Text("Slot")
                    ) {
                        Text("Pick a Slot")
                            .tag("null")
                        ForEach(viewModel.availableSlotUnits) { unit in
                            
                            if(unit.vip) {
                                Text("\(unit.slotID) - VIP")
                                    .tag("\(unit.slotID)")
                            }
                            else {
                                Text("\(unit.slotID)")
                                    .tag("\(unit.slotID)")
                            }
                            
                        }
                        .background(Color.green)
                    }
                }
                Text("You have to be within 1 km of NIBM to book a slot")
                    .padding()
                    .multilineTextAlignment(.center)
                
                NavigationLink(
                    destination: ReserveSlotView(
                        slotId: selection
                    ),
                    isActive: $isReserveViewActive
                ){
                    Button(action: {
                        isReserveViewActive = true
                    }) {
                        DefaultButtonTextView(
                            text:"Book",
                            foregroundColor: .black,
                            backgroundColor: .yellow
                        )
                    }
                    
                }
                .opacity((selection != "null") ? 1 : 0.6)
                .disabled(selection == "null")
                
                Rectangle().fill(Color.blue).frame(width: 250, height: 2, alignment: .center).padding();
            }
            
            
            Spacer();
            
            Group {
                Text("Book your slot by scanning QR code")
                    .padding()
                    .multilineTextAlignment(.center)
                
                NavigationLink(
                    destination: ScanQRView(),
                    isActive: $isScanQRActive
                ){
                    Button(action: {
                        isScanQRActive = true
                    }) {
                        DefaultButtonTextView(
                            text:"Scan QR code",
                            foregroundColor: .white,
                            backgroundColor: .red
                        )
                    }
                }
                
            }
            
            Spacer()
        }
        .onAppear() {
            viewModel.getAvailableSlots();
        }
        
    }
}

struct BookingPageView_Previews: PreviewProvider {
    static var previews: some View {
        BookingPageView()
    }
}
