//
//  Serialize.swift
//  Collection
//
//  Created by ijk on 4/10/19.
//  Copyright © 2019 x. All rights reserved.
//

import Foundation

class Serialize{
    static func getEncode(obj: Dog) -> String {
        let jsonEncoder = JSONEncoder()
        let jsonData = (try? jsonEncoder.encode(obj))!
        let jsonString = String(data: jsonData, encoding: .utf8)
        return jsonString!
    }
}
