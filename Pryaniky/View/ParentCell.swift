//
//  ParentCell.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import UIKit

class ParentCell: UITableViewCell {

    // MARK: - Properties
    
    var data: AnyObject? {
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
        // Will be implemented in subclasses
    }

    func updateUI() {
        // Will be implemented in subclasses
    }

}
