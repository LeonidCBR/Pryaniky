//
//  TextCell.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import UIKit

class TextCell: ParentCell {

    // MARK: - Methods
    
    override func updateUI() { 
        guard let textData = data as? HZ else {
            print("ERROR: Failed to casting text data!")
            return
        }

        textLabel?.text = textData.text
    }

}
