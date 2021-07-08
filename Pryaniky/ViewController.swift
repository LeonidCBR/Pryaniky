//
//  ViewController.swift
//  Pryaniky
//
//  Created by Яна Латышева on 08.07.2021.
//

import UIKit

struct K {
    static let url = URL(string: "https://pryaniky.com/static/json/sample.json")!

    static let hz = "hz"
    static let picture = "picture"
    static let selector = "selector"

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

}

struct HZ: Decodable {
    let text: String
}

struct Picture: Decodable {
    let url: String
    let text: String
}

struct Variant: Decodable {
    let id: Int
    let text: String
}

struct Selector: Decodable {
    let selectedId: Int
    let variants: [Variant]
}


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

struct JsonData: Decodable {
    let data: [DataItem]
    let view: [String]
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        print("DEBUG: - Получаем список данных нескольких типов")
/*
        let task = URLSession.shared.dataTask(with: K.url) { data, response, error in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("DEBUG: There is no data!")
                return
            }

            print("Got data!")
            if let dataStr = String(data: data, encoding: .utf8) {
                print(dataStr)
            }

            try? self.jsonDecode(data)


        }
        task.resume()
*/

        guard let jsonData = try? jsonDecode(K.jsonData) else {
            print("DEBUG: Decoding error")
            return
        }

        print(jsonData)


    }

    func jsonDecode(_ data: Data) throws -> JsonData? {
        let decoder = JSONDecoder()
        let jsonData = try decoder.decode(JsonData.self, from: data)
        return jsonData
    }

}
