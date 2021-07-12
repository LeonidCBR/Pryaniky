//
//  Constants.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import Foundation

struct K {
    static let url = URL(string: "https://pryaniky.com/static/json/sample.json")!

    static let mainCellIdentifier = "mainCellIdentifier"

    static let hz = "hz"
    static let picture = "picture"
    static let selector = "selector"

    static let dictTypes = [hz: JsonDataType.text,
                            picture: JsonDataType.picture,
                            selector: JsonDataType.selector]
/*
    static let jsonData = """
        {
            "data": [{
                    "name": "hz",
                    "data": {
                        "text": "Текстовый блок"
                    }
                }, {
                    "name": "picture",
                    "data": {
                        "url": "https://pryaniky.com/static/img/logo-a-512.png",
                        "text": "Пряники"
                    }
                }, {
                    "name": "selector",
                    "data": {
                        "selectedId": 1,
                        "variants": [{
                                "id": 1,
                                "text": "Вариант раз"
                            }, {
                                "id": 2,
                                "text": "Вариант два"
                            }, {
                                "id": 3,
                                "text": "Вариант три"
                            }
                        ]
                    }
                }
            ],
            "view": ["hz", "selector", "picture", "hz"]
        }
    """.data(using: .utf8)!
*/
}
