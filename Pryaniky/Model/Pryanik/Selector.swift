//
//  Selector.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import Foundation

struct Selector: Codable {
    let name: String
    var data: SelectorData

    var text: String {
        return data.text
    }

    var variantsCount: Int {
        return data.variantsCount
    }

    var id: Int {
        get {
            return data.variants.firstIndex { $0.id == data.selectedId } ?? 0
        }
        set {
            data.selectedId = data.variants[newValue].id
        }
    }
/*
    var id: Int {
        get {
            return data.variants.firstIndex { $0.id == selectedId } ?? 0
        }
        set {
            print(newValue)
            print(data.variants[newValue - 1].id)
            data.selectedId = data.variants[newValue - 1].id
            print("new id is \(data.selectedId)")
        }
    }*/
}

struct SelectorData: Codable {

    struct Variant: Codable {
        let id: Int
        let text: String
    }

//    private let variants: [Variant]
    let variants: [Variant]

    var selectedId: Int {
        didSet {
//            if (selectedId - 1 < variants.startIndex) || (selectedId - 1 > variants.endIndex) {
//                // if selectedId has invalid value set it to first position
//                return selectedId = variants.startIndex + 1
//            }
        }
    }



    var text: String {
        return variants.first() { $0.id == selectedId }?.text ?? "SelectedId is invalid!"
    }

    var variantsCount: Int {
        return variants.count
    }
}
