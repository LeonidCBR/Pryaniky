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
        txt.numberOfLines = 0
        return txt
    }()

    let pryanikCellViewModel: PryanikCellViewModel


    // MARK: - Lifecycle

    init(with pryanikCellViewModel: PryanikCellViewModel) {
        self.pryanikCellViewModel = pryanikCellViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
//        self.pryanikCellViewModel = PryanikCellViewModel(from: .unknown(UnknownData(name: "Dummy", text: "Dummy")))
        let unknown = Unknown(name: "Dummy", data: UnknownData.init(text: "Dummy text"))
        self.pryanikCellViewModel = PryanikCellViewModel(from: .unknown(unknown))
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }


    // MARK: - Methods
    
    func configureUI() {
        view.backgroundColor = .systemTeal

        view.addSubview(infoLabel)
        infoLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 100.0,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 100.0,
                         leading: view.safeAreaLayoutGuide.leadingAnchor, paddingLeading: 100.0,
                         trailing: view.safeAreaLayoutGuide.trailingAnchor, paddingTrailing: 100.0)
        configurePryanik()
    }

    func configurePryanik() {
        let pryanik = pryanikCellViewModel.pryanik
        infoLabel.text = "Object: [\(pryanik.unassociated.rawValue)]\n\(pryanik.text)"
    }

}
