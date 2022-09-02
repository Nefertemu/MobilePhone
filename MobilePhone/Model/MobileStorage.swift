//
//  DataSource.swift
//  MobilePhone
//
//  Created by Bogdan Anishchenkov on 02.09.2022.
//

import Foundation

// Implement mobile phone storage protocol
// Requirements:
// - Mobiles must be unique (IMEI is an unique number)
// - Mobiles must be stored in memory

protocol MobileStorage {
    func getAll() -> Set<Mobile>
    func findByImei(_ imei: String) -> Mobile?
    func save(_ mobile: Mobile) throws -> Mobile
    func delete(_ product: Mobile) throws
    func exists(_ product: Mobile) -> Bool
}

struct Mobile: Hashable {
    let imei: String
    let model: String
}

extension Mobile: MobileStorage {
    
    func getAll() -> Set<Mobile> {
        var mobilePhones = Set<Mobile>()

        let shuffledImeis = DataStore.shared.imeis.shuffled()
        let shuffledModels = DataStore.shared.models.shuffled()
        
        let numberOfItetations = min(shuffledImeis.count, shuffledModels.count)
        
        for iteration in 0..<numberOfItetations {
            let mobilePhone = Mobile(
                imei: shuffledImeis[iteration],
                model: shuffledModels[iteration]
            )
            mobilePhones.insert(mobilePhone)
        }
        return mobilePhones
    }
    
    func findByImei(_ imei: String) -> Mobile? {
        let mobilePhones = getAll()
        var foundByImei = Mobile(imei: "", model: "")
        
        for mobilePhone in mobilePhones {
            if mobilePhone.imei == imei {
                foundByImei = mobilePhone
            }
        }
        
        return foundByImei
    }
    
    func save(_ mobile: Mobile) throws -> Mobile {
        DataStore.shared.models.append(mobile.model)
        DataStore.shared.imeis.append(mobile.imei)
        
        return mobile
    }
    
    func delete(_ product: Mobile) throws {
        if DataStore.shared.models.contains(product.model) && DataStore.shared.models.contains(product.imei)  {
            DataStore.shared.models.filter { $0 != product.model }
            DataStore.shared.imeis.filter { $0 != product.imei }
        }
    }
    
    func exists(_ product: Mobile) -> Bool {
        let mobilePhones = getAll()
        var exists: Bool = false
        
        for mobilePhone in mobilePhones {
            if product == mobilePhone {
                exists = true
            }
        }
        
        return exists
    }
    
}
