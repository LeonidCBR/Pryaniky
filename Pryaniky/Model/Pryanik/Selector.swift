//
//  Selector.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import Foundation

struct Selector: Codable {

    struct Variant: Codable {
        let id: Int
        let text: String
    }

    private let variants: [Variant]

    var selectedId: Int {
        didSet {
            if (selectedId - 1 < variants.startIndex) || (selectedId - 1 > variants.endIndex) {
                // if selectedId has invalid value set it to first position
                return selectedId = variants.startIndex + 1
            }
        }
    }

    var text: String {
        return variants.first() { $0.id == selectedId }?.text ?? "SelectedId is invalid!"
    }

    var variantsCount: Int {
        return variants.count
    }
}
