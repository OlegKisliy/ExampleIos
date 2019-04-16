//
//  ObjectPojo.swift
//  Collection
//
//  Created by ijk on 4/10/19.
//  Copyright © 2019 x. All rights reserved.
//

import Foundation


public struct Dog: Codable {
    let name: String
    let breed: String
    let height: String
    let weight: String
    
    func getBark() -> String {
        return "Gav!"
    }
    
//    let data: Set<String>
    
//    init(name: String?, data: Set<String>) {
//        self.name = name ?? "<#default value#>"
//        self.data = data
//    }
    
}
