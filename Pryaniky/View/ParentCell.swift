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
    
    var pryanik: Pryanik? {
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
        contentView.addSubview(pryanikText)
        pryanikText.anchor(top: contentView.topAnchor, paddingTop: 20.0,
                           bottom: contentView.bottomAnchor, paddingBottom: 20.0,
                           leading: contentView.leadingAnchor, paddingLeading: 20.0,
                           trailing: contentView.trailingAnchor, paddingTrailing: 20.0)
    }

    func updateUI() {
        pryanikText.text = pryanik?.text
    }

}
