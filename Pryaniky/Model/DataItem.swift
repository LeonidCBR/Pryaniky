//
//  DataItem.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import Foundation

struct DataItem: Decodable {
    let name: String
    let data: AnyObject /// it could be HZ, Picture or Selector

    enum DataItemKeys: String, CodingKey
    {
        case name, data
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DataItemKeys.self)
        name = try container.decode(String.self, forKey: .name)

        if name == K.hz {
            data = try container.decode(HZ.self, forKey: .data) as AnyObject

        } else if name == K.picture {
            data = try container.decode(Picture.self, forKey: .data) as AnyObject

        } else if name == K.selector {
            data = try container.decode(Selector.self, forKey: .data) as AnyObject

        } else {
            data = "Decoding error" as AnyObject
        }
    }
}
