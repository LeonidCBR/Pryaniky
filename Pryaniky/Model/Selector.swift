//
//  Selector.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import Foundation

struct Selector: Decodable {
    let selectedId: Int
    let variants: [Variant]
}
