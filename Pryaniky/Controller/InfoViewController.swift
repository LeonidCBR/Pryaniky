//
//  InfoViewController.swift
//  Pryaniky
//
//  Created by Яна Латышева on 11.07.2021.
//

import UIKit

class InfoViewController: UIViewController {

    // MARK: - Properties

    let infoLabel: UILabel = {
        let txt = UILabel()
        txt.font = UIFont.boldSystemFont(ofSize: 20)
        txt.textColor = .white
        txt.textAlignment = .center
        return txt
    }()

    var infoItem: (Int, String)? {
        didSet {
            configInfoItem()
        }
    }


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }


    // MARK: - Methods
    
    func configureUI() {
        view.backgroundColor = .systemTeal

        view.addSubview(infoLabel)
        infoLabel.anchor(centerX: view.centerXAnchor,
                         centerY: view.centerYAnchor)
    }

    func configInfoItem() {
        guard let infoItem = infoItem else { return }

        infoLabel.text = "Object: [\(infoItem.0)] \(infoItem.1)"
    }

}
