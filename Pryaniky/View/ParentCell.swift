//
//  ParentCell.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import UIKit

class ParentCell: UITableViewCell {

    // MARK: - Properties

    let pryanikText: UILabel = {
        let txt = UILabel()
        txt.font = UIFont.boldSystemFont(ofSize: 14)
        txt.numberOfLines = 0
        txt.textAlignment = .center
        return txt
    }()

    var pryanikCellViewModel: PryanikCellViewModel? {
        didSet {
            updateUI()
        }
    }


    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }


    // MARK: - Methods

    func configureUI() {
    }

    func updateUI() {
        pryanikText.text = pryanikCellViewModel?.pryanik.text
    }
}
