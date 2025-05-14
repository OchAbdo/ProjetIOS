//
//  ElectricBike.swift
//  ProjetIOS
//
//  Created by Tekup-mac-7 on 14/5/2025.
//

import Foundation
class ElectricBike : Encodable ,Decodable
{
    var id: String = ""
    var img : String = ""
    var name : String = ""
    var vitesse : String = ""
    
}

extension Encodable
{
    var toDictionary:[String : Any]?{
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        return try? JSONSerialization.jsonObject(with: data , options: .allowFragments)as? [String:Any]
    }
}
