//
//  Pryanik.swift
//  Pryaniky
//
//  Created by Яна Латышева on 12.07.2021.
//

import Foundation

enum Pryanik: Codable {
    case hz(HZ)
    case picture(Picture)
    case selector(Selector)
    case unknown(UnknownData)

    enum Unassociated: String {
        case hz
        case picture
        case selector
        case unknown
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case data
    }

    var text: String {
        switch self {
        case .hz(let hz): return hz.text
        case .picture(let picture): return picture.text
        case .selector(let selector): return selector.text
        case .unknown(let unknown): return unknown.text
        }
    }

    var unassociated: Unassociated {
        switch self {
        case .hz: return .hz
        case .picture: return .picture
        case .selector: return .selector
        case .unknown: return .unknown
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        switch try container.decode(String.self, forKey: .name) {
        case Unassociated.hz.rawValue:
            self = .hz(try container.decode(HZ.self, forKey: .data))

        case Unassociated.picture.rawValue:
            self = .picture(try container.decode(Picture.self, forKey: .data))

        case Unassociated.selector.rawValue:
            self = .selector(try container.decode(Selector.self, forKey: .data))

        default:
            // trying to decode as dummy data
            print("DEBUG: Trying to decode unknown item as dummy data...")
            if let unknownData = try? container.decode(UnknownData.self, forKey: .data) {
                self = .unknown(unknownData)
            } else {
                print("DEBUG: We've got unknown data without text block!")
                self = .unknown(UnknownData(text: "Unknown block of data"))
            }
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .hz(let hz):
            try container.encode(hz, forKey: .data)
        case .picture(let picture):
            try container.encode(picture, forKey: .data)
        case .selector(let selector):
            try container.encode(selector, forKey: .data)
        case .unknown(let unknownData):
            try container.encode(unknownData, forKey: .data)
        }

        try container.encode(unassociated.rawValue, forKey: .name)

    }
}
