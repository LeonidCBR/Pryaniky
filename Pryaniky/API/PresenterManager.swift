//
//  PresenterManager.swift
//  Pryaniky
//
//  Created by Яна Латышева on 12.07.2021.
//

import UIKit

struct PresenterManager {

    static let shared = PresenterManager()

    private init() {}

    func showMessage(withTitle title: String, andMessage message: String, byViewController viewController: UIViewController, completion: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        viewController.present(alert, animated: true, completion: completion)
    }
}
