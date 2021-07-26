//
//  HZ.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import Foundation

struct HZ: Codable {
    let name: String
    let data: HzData

    var text: String {
        return data.text
    }
}

struct HzData: Codable {
    let text: String
}
