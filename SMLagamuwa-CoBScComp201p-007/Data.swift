//
//  Data.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 10/30/21.
//

import Foundation
import FirebaseFirestore

class API {
    
    init() {
        self.database = Firestore.firestore();
        self.userRef = database.collection("Users");
    }
    
    var listener: ListenerRegistration?;
    var availableSlotListener: ListenerRegistration?;
    
    let database: Firestore;
    let userRef: CollectionReference;
    
    func getSlots(completion: @escaping ([SlotModel]) -> ()) {
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
    
    func setUser(userData: UserModel ,completion: @escaping (UserModel) -> ()) {
        
        let user = [
            "email": userData.email,
            "nibmId": userData.nibmId,
            "vehicleNo": userData.vehicleNo,
            "name": userData.name,
            "nic": userData.nic
        ]
        
        let docRef = userRef.addDocument(data: user)
        
        let newUser = UserModel(
            id: docRef.documentID,
            email: userData.email,
            name: userData.name,
            vehicleNo: userData.vehicleNo,
            nibmId: userData.nibmId,
            nic: userData.nic
        )
        
        DispatchQueue.main.async {
            completion(newUser)
        }
    }
    
    func getUser(email: String ,completion: @escaping (UserModel) -> ()) {
        
        userRef
            .whereField("email", isEqualTo: email)
            .limit(to: 1)
            .getDocuments { doc, error in
                guard let document = doc?.documents else {
                    print("Error fetching document: \(error!)")
                    return
                }
                
                let userData = document.map { d in
                    return UserModel(id: d.documentID,
                                     email: d["email"] as? String ?? "",
                                     name: d["name"] as? String ?? "",
                                     vehicleNo: d["vehicleNo"] as? String ?? "",
                                     nibmId: d["nibmId"] as? String ?? "",
                                     nic: d["nic"] as? String ?? ""
                    )
                }
                
                let user = userData[0]
                
                DispatchQueue.main.async {
                    completion(user)
                }
            }
    }
}
