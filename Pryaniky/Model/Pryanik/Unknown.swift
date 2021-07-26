//
//  Dummy.swift
//  Pryaniky
//
//  Created by Яна Латышева on 19.07.2021.
//

import Foundation

struct Unknown: Codable {
    let name: String
    let data: UnknownData

    var text: String {
        return data.text
    }

}

struct UnknownData: Codable {
    let text: String
}
