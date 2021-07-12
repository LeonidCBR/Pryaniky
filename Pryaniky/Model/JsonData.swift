//
//  JsonData.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import Foundation

struct JsonData: Decodable {
    let data: [DataItem]
    let view: [String]

    init(from data: Data) throws {
        let decoder = JSONDecoder()
        self = try decoder.decode(JsonData.self, from: data)
    }

}
