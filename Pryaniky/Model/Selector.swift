//
//  Selector.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import Foundation

struct Selector: Pryanik, Decodable {
    
    var text: String {
        return variants.first() { $0.id == selectedId }?.text ?? "SelectedId is invalid!"
    }

    var selectedId: Int {
        didSet {
            if (selectedId - 1 < variants.startIndex) || (selectedId - 1 > variants.endIndex) {
                return selectedId = variants.startIndex + 1
            }
        }
    }
    private let variants: [Variant]

    var variantsCount: Int {
        return variants.count
    }
}
