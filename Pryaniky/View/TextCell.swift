//
//  TextCell.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import UIKit

class TextCell: ParentCell {

    // MARK: - Methods

    override func configureUI() {
        contentView.addSubview(pryanikText)
        pryanikText.anchor(top: contentView.topAnchor, paddingTop: 20.0,
                           bottom: contentView.bottomAnchor, paddingBottom: 20.0,
                           leading: contentView.leadingAnchor, paddingLeading: 20.0,
                           trailing: contentView.trailingAnchor, paddingTrailing: 20.0)
    }

}
