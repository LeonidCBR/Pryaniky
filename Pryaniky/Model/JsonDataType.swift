//
//  JsonDataType.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import Foundation

enum JsonDataType: CustomStringConvertible {

    case text
    case picture
    case selector

    var description: String {
        switch self {
        case .text: return K.hz
        case .picture: return K.picture
        case .selector: return K.selector
        }
    }

/*
    init?(rawValue: String) {
        if rawValue == "hz" {
            self = JsonDataType.text

        } else if rawValue == "picture" {
            self = JsonDataType.picture

        } else if rawValue == "selector" {
            self = JsonDataType.selector

        } else {
            return nil
        }
    }
*/
}
