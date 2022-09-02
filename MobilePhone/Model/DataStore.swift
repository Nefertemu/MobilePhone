//
//  DataSource.swift
//  MobilePhone
//
//  Created by Bogdan Anishchenkov on 02.09.2022.
//

import Foundation

class DataStore {
    
    static let shared = DataStore()
    
    var imeis = [
        "12345678", "89349284", "324235235", "23523552", "325235235",
        "23535235", "253325235", "2352355", "52352352", "23523523532"
    ]
    
    var models = [
        "Iphone 8", "Iphone 7", "Iphone X", "Iphone 11", "Iphone 13",
        "Iphone 6", "Iphone 12 Pro", "Iphone 13 Pro Max", "Iphone 11 Pro", "Iphone 11 Pro Max"
    ]
    
    private init() {}
}
