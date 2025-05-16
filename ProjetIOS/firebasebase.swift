import Foundation
import FirebaseDatabase
import Firebase

class FirebaseService: ObservableObject {
    private var databaseRef: DatabaseReference

    @Published var listb: [ListBike] = []

    init() {
        self.databaseRef = Database.database().reference()
        self.listobj()
    }

    func listobj() {
        let bikesRef = databaseRef.child("bikes")

        bikesRef.observe(.value) { snapshot in
            var bikes: [ListBike] = []

            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                   let value = childSnapshot.value as? [String: Any],
                   let id = value["id"] as? String,
                   let name = value["name"] as? String,
                   let type = value["type"] as? String,
                   let speed = value["speed"] as? String,
                   let brand = value["brand"] as? String,
                   let image = value["image"] as? String {
                    
                    let bike = ListBike(id: id, name: name, type: type, speed: speed, brand: brand, img:image)
                    bikes.append(bike)
                }
            }

            DispatchQueue.main.async {
                self.listb = bikes
            }
        }
    }
}
