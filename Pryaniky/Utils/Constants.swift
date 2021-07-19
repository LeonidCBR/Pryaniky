//
//  Constants.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import Foundation

struct K {
    static let url = URL(string: "https://pryaniky.com/static/json/sample.json")!
    static let urlMultiData = URL(string: "https://pryaniky.com/static/json/much-more-items-in-data.json")!

    static let mainCellIdentifier = "mainCellIdentifier"
    static let dummyCellIdentifier = "dummyCellIdentifier"

    static let hz = "hz"
    static let picture = "picture"
    static let selector = "selector"

    static let dictTypes = [hz: JsonDataType.text,
                            picture: JsonDataType.picture,
                            selector: JsonDataType.selector]


    // MARK: - Data for testing

    static let simpleJsonData = """
        {
            "data": [
                {
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
                        "variants": [
                            {
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


    static let jsonDataWithUnknownBlocks = """
        {
            "data": [
                {
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
                        "variants": [
                            {
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
                }, {
                    "name": "audio",
                    "data": {
                        "text": "My music",
                        "url": "https://ya.ru/mymusic.mp3",
                        "cover": "https://ya.ru/mycover.png"
                    }
                }, {
                    "name": "other",
                    "data": {
                        "no-text": "No text",
                        "other": "https://ya.ru/mycover.png"
                    }
                }
            ],
            "view": ["hz", "audio", "other", "unknownKey", "selector", "picture", "hz"]
        }
    """.data(using: .utf8)!


    static let multiJsonData = """
    {
        "data": [
            {
                "name": "picture",
                "data": {
                    "url": "https://pryaniky.com/static/img/logo-a-512.png",
                    "text": "Пряники"
                }
            }, {
                "name": "picture",
                "data": {
                    "url": "https://pryaniky.com/static/img/logo-c-512.png",
                    "text": "Пряники.Чат 1"
                }
            }, {
                "name": "picture",
                "data": {
                    "url": "https://pryaniky.com/static/img/logo-c-512.png",
                    "text": "Пряники.Чат 2"
                }
            }, {
                "name": "picture",
                "data": {
                    "url": "https://pryaniky.com/static/img/logo-c-512.png",
                    "text": "Пряники.Чат 3"
                }
            }, {
                "name": "hz",
                "data": {
                    "text": "Первый некоторый текст"
                }
            }, {
                "name": "hz",
                "data": {
                    "text": "Второй некоторый текст"
                }
            },  {
                "name": "selector",
                "data": {
                    "selectedId": 2,
                    "variants": [
                        {
                            "id": 1,
                            "text": "Вариант какой-то"
                        }, {
                            "id": 2,
                            "text": "Вариант по значению"
                        }, {
                            "id": 3,
                            "text": "Вариант по индексу"
                        }
                    ]
                }
            },  {
                "name": "selector",
                "data": {
                    "selectedId": 2,
                    "variants": [
                        {
                            "id": 1,
                            "text": "Вариант3 какой-то"
                        }, {
                            "id": 2,
                            "text": "Вариант3 по значению"
                        }, {
                            "id": 3,
                            "text": "Вариант3 по индексу"
                        }
                    ]
                }
            },  {
                "name": "selector",
                "data": {
                    "selectedId": 1,
                    "variants": [
                        {
                            "id": 1,
                            "text": "Вариант2  по значению"
                        }, {
                            "id": 2,
                            "text": "Вариант2 по индексу"
                        }, {
                            "id": 3,
                            "text": "Вариант2 ещё один"
                        }
                    ]
                }
            }
        ],
        "view": ["hz", "selector", "picture", "hz", "picture", "selector"]
    }
    """.data(using: .utf8)!

}
