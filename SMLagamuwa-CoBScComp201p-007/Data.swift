//
//  Data.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 10/30/21.
//

import Foundation
import FirebaseFirestore

class API {
    
    init() {}
    
    var listener: ListenerRegistration?;
    var availableSlotListener: ListenerRegistration?;
    
    func getSlots(completion: @escaping ([SlotModel]) -> ()) {
        let database = Firestore.firestore();
        //        let docRef = database.document("TestDocument/test");
        //        docRef.setData(["text": "test"]);
        
        let colRef = database.collection("Slots");
        listener = colRef.order(by: "slotID", descending: false)
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                
                let slots = documents.map { d in
                    return SlotModel(id: d.documentID,
                                     slotID: d["slotID"] as? Int ?? 0,
                                     status: d["status"] as? String ?? "",
                                     type: d["type"] as? String ?? "",
                                     userID: d["userID"] as? String ?? "",
                                     vehicleNo: d["vehicleNo"] as? String ?? "")
                }
                
                DispatchQueue.main.async {
                    completion(slots)
                }
            }
    }
    
    func getAvailableSlots(completion: @escaping ([SlotModel]) -> ()) {
        let database = Firestore.firestore();
        
        let colRef = database.collection("Slots");
        availableSlotListener = colRef
            .order(
                by: "slotID",
                descending: true)
            .whereField(
                "status",
                in: ["AVAILABLE"])
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                
                let slots = documents.map { d in
                    return SlotModel(id: d.documentID,
                                     slotID: d["slotID"] as? Int ?? 0,
                                     status: d["status"] as? String ?? "",
                                     type: d["type"] as? String ?? "",
                                     userID: d["userID"] as? String ?? "",
                                     vehicleNo: d["vehicleNo"] as? String ?? "")
                }
                
                DispatchQueue.main.async {
                    completion(slots)
                }
            }
    }
}
