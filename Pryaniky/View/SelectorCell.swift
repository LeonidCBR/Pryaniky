//
//  SelectorCell.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import UIKit

class SelectorCell: ParentCell {

    // MARK: - Properties

    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.addTarget(self, action: #selector(pageChanged), for: .valueChanged)
        pc.tintColor = .blue
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = .black
        return pc
    }()


    // MARK: - Methods

    override func configureUI() {
        contentView.addSubview(pryanikText)
        pryanikText.anchor(top: contentView.topAnchor, paddingTop: 10.0,
                            leading: contentView.leadingAnchor, paddingLeading: 10.0,
                            trailing: contentView.trailingAnchor, paddingTrailing: 10.0)

        contentView.addSubview(pageControl)
        pageControl.anchor(top: pryanikText.bottomAnchor, paddingTop: 10.0,
                               bottom: contentView.bottomAnchor, paddingBottom: 10.0,
                               centerX: contentView.centerXAnchor)
    }

    override func updateUI() {
        super.updateUI()
        configureSelectorControl()
    }

    func configureSelectorControl() {
        if case .selector(let selector) = pryanikCellViewModel?.pryanik {
            pageControl.numberOfPages = selector.variantsCount
//            pageControl.currentPage = selector.selectedId - 1
            pageControl.currentPage = selector.id
            //pageControl.currentPage = selector.id
        }
    }


    // MARK: - Selectors

    @objc func pageChanged() {
        if case .selector(var selector) = pryanikCellViewModel?.pryanik {
            //!!!selector.selectedId = pageControl.currentPage + 1
            selector.id = pageControl.currentPage
            //selector.id = pageControl.currentPage + 1
            pryanikText.text = selector.text
            pryanikCellViewModel?.pryanik = .selector(selector)
        }
    }
}
