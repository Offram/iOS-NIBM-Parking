//
//  ReserveSlotViewModel.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/14/21.
//

import Foundation
import MapKit
import SwiftUI

class ReserveSlotViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let nibm = CLLocationCoordinate2D(
        latitude: 6.906444520729029,
        longitude: 79.87060594796698)
    
    @Published var region: MKCoordinateRegion
    
    var locationManager: CLLocationManager?
    @Published var distanceFromNibm: Double?
    @Published var navigateToMain: Bool = false
    
    override init() {
        self.region = MKCoordinateRegion(
            center: self.nibm,
            span: MKCoordinateSpan(
                latitudeDelta: 0.005,
                longitudeDelta: 0.005)
        )
    }
    
    func checkLocationServiceEnabledInDevice() {
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
        }
        else {
            print("# Enable it")
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAppEnabledLocation()
    }
    
    private func checkAppEnabledLocation() {
        guard let locationManager = locationManager else {
            return
        }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("# Restricted")
        case .denied:
            print("# Denied")
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
        
    }
    
    func getDistance() {

        let nibmLoc = CLLocation(
            latitude: self.nibm.latitude,
            longitude: self.nibm.longitude
        )
        if(locationManager?.location?.coordinate != nil) {
            let userLoc = CLLocation(
                latitude: locationManager?.location?.coordinate.latitude ?? 0,
                longitude: locationManager?.location?.coordinate.longitude ?? 0
            )
            
            let distance = nibmLoc.distance(from: userLoc)
            self.distanceFromNibm = distance
        }
        else {
            self.distanceFromNibm = 5000
        }
    }
    
    func isDistanceValid() -> Bool {
        if((self.distanceFromNibm ?? 9999) < 1000) {
            return true
        }
        return false
    }
    
    func getBackgroundColorOnDistance() -> Color {
        if(self.isDistanceValid()) {
            return Color.green
        }
        return Color.yellow
    }
    
    func confirmReservation(slotId: String, user: UserModel) {
        
        API().setSlot(user: user, slotId: slotId, tragetStatus: SlotStatus.reserved) { state in
            if state {
                
                self.navigateToMain = true
            }
            
        }
        
    }
}
