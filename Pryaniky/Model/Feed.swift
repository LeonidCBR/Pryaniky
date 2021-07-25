//
//  Feed.swift
//  Pryaniky
//
//  Created by Яна Латышева on 25.07.2021.
//

import Foundation

struct Feed: Codable {

    // Массив всех данных
    let pryaniky: [Pryanik]

    // Массив имен типов для последующего отображения
    let viewItems: [String]

    enum CodingKeys: String, CodingKey {
        case pryaniky = "data"
        case viewItems = "view"
    }

    init() {
        // create blank feed
        viewItems = []
        pryaniky = []
    }
}
