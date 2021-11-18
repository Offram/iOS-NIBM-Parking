//
//  ReserveSlotView.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/14/21.
//

import SwiftUI
import MapKit

struct ReserveSlotView: View {
    
    var slotId: String
    @StateObject private var viewModel = ReserveSlotViewModel()
    @EnvironmentObject var signInviewModel: SignInViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .onAppear {
                    viewModel.checkLocationServiceEnabledInDevice()
                    
                    viewModel.getDistance()
                }
            if (viewModel.distanceFromNibm != nil) {
                VStack {
                    HStack {
                        Spacer()
                        Text("Distance: \(viewModel.distanceFromNibm ?? 0)")
                            .padding()
                            .background(viewModel.getBackgroundColorOnDistance())
                    }
                    Spacer()
                    
                    NavigationLink(
                        destination: MainView(),
                        isActive: $viewModel.navigateToMain
                    ) {
                        Button(action: {
                            viewModel.confirmReservation(
                                slotId: slotId,
                                user: signInviewModel.user!
                            )
                        }) {
                            DefaultButtonTextView(
                                text:"Confirm",
                                foregroundColor: .black,
                                backgroundColor: .yellow
                            )
                                .opacity(viewModel.isDistanceValid() ? 1 : 0.6)
                                .disabled(!viewModel.isDistanceValid())
                        }
                    }
                    
                }
            }
            
        }
    }
}

struct ReserveSlotView_Previews: PreviewProvider {
    static var previews: some View {
        ReserveSlotView(slotId: "1")
    }
}
