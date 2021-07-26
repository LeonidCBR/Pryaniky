//
//  Picture.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import Foundation

struct Picture: Codable {
    let name: String
    let data: PictureData

    var text: String {
        return data.text
    }

    var url: String {
        return data.url
    }
}

struct PictureData: Codable {
    let text: String
    let url: String
    
}
