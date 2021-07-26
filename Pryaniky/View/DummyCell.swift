//
//  DummyCell.swift
//  Pryaniky
//
//  Created by Яна Латышева on 19.07.2021.
//

import UIKit

class DummyCell: ParentCell {

    // MARK: - Properties

    let pryanikName: UILabel = {
        let txt = UILabel()
        txt.font = UIFont.boldSystemFont(ofSize: 10)
        txt.numberOfLines = 0
        txt.textAlignment = .center
        txt.text = "Dummy name"
        return txt
    }()


    // MARK: - Methods

    override func configureUI() {
        backgroundColor = .lightGray

        contentView.addSubview(pryanikName)
        pryanikName.anchor(top: contentView.topAnchor, paddingTop: 20.0,
                           leading: contentView.leadingAnchor, paddingLeading: 10.0,
                           trailing: contentView.trailingAnchor, paddingTrailing: 10.0)

        contentView.addSubview(pryanikText)
        pryanikText.anchor(top: pryanikName.bottomAnchor, paddingTop: 10.0,
                           bottom: contentView.bottomAnchor, paddingBottom: 20.0,
                            leading: contentView.leadingAnchor, paddingLeading: 10.0,
                            trailing: contentView.trailingAnchor, paddingTrailing: 10.0)
    }

    override func updateUI() {
        pryanikName.text = pryanikCellViewModel?.pryanik.name
        pryanikText.text = pryanikCellViewModel?.pryanik.text
    }

}
