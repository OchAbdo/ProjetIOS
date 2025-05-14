//
//  firebasebase.swift
//  ProjetIOS
//
//  Created by Tekup-mac-7 on 14/5/2025.
//

import Foundation
import FirebaseDatabase
import Firebase

class FirebaseService: ObservableObject {
    private var databaseRef: DatabaseReference

    
    init() {
            // Référence vers la base de données Firebase
            self.databaseRef = Database.database().reference()
            //self.readObject()
            self.listobj()
        }

    
    @Published
    var listb : [ListBike] = []
    
    @Published
    var obje : ElectricBike = ElectricBike()
    
    

    
    
    func listobj(){
        databaseRef.observe(.value){
            parentSnapshot in
            guard let children = parentSnapshot.children.allObjects as?  [DataSnapshot] else {
                return
            }
            
            self.listb = children.compactMap({ snapshot in
                return try? snapshot.data(as: ListBike.self)
            })
        }
    }
    
   
}


