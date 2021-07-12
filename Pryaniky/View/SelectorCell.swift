//
//  SelectorCell.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import UIKit

class SelectorCell: ParentCell {

    // MARK: - Properties

    let selectorText: UILabel = {
        let txt = UILabel()
        txt.font = UIFont.boldSystemFont(ofSize: 14)
        txt.textColor = .systemBlue
        txt.numberOfLines = 0
        txt.textAlignment = .center
        return txt
    }()

    let selectorControl: UIPageControl = {
        let pc = UIPageControl()
        pc.tintColor = .blue
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = .black
        return pc
    }()


    // MARK: - Methods

    override func configureUI() {
        contentView.addSubview(selectorText)
        selectorText.anchor(top: contentView.topAnchor, paddingTop: 10.0,
                            leading: contentView.leadingAnchor, paddingLeading: 10.0,
                            trailing: contentView.trailingAnchor, paddingTrailing: 10.0)

        contentView.addSubview(selectorControl)
        selectorControl.anchor(top: selectorText.bottomAnchor, paddingTop: 10.0,
                               bottom: contentView.bottomAnchor, paddingBottom: 10.0,
                               centerX: contentView.centerXAnchor)
    }

    override func updateUI() {
        configureSelectorText()
        configureSelectorControl()
    }

    func configureSelectorControl() {
        guard let selectorData = data as? Selector else {
            print("ERROR: Failed to casting picture data!")
            return
        }

        selectorControl.numberOfPages = selectorData.variants.count
        selectorControl.currentPage = selectorData.selectedId
    }

    func configureSelectorText() {
        guard let selectorData = data as? Selector else {
            print("ERROR: Failed to casting picture data!")
            return
        }

        let selectedId = selectorData.selectedId
        selectorText.text = selectorData.variants[selectedId].text
    }

}
