//
//  PictureCell.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import UIKit

class PictureCell: ParentCell {

    // MARK: - Properties

    let pictureView : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        return iv
    }()

    let pictureText: UILabel = {
        let txt = UILabel()
        txt.font = UIFont.systemFont(ofSize: 14)
//        txt.textColor = .systemBlue
        txt.numberOfLines = 0
        txt.textAlignment = .center
        return txt
    }()


    // MARK: - Methods

    override func configureUI() {
        contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 160).isActive = true

        contentView.addSubview(pictureView)
        pictureView.anchor(top: contentView.topAnchor, paddingTop: 30.0,
                           bottom: contentView.bottomAnchor, paddingBottom: 30.0,
                           leading: contentView.leadingAnchor, paddingLeading: 20.0,
                           width: 100.0/*,
                           height: 100.0*/)

        contentView.addSubview(pictureText)
        pictureText.anchor(leading: pictureView.trailingAnchor, paddingLeading: 10.0,
                           trailing: contentView.trailingAnchor, paddingTrailing: 10.0,
                           centerY: contentView.centerYAnchor)
    }

    override func updateUI() {
        guard let pictureData = data as? Picture else {
            print("ERROR: Failed to casting picture data!")
            return
        }

        pictureText.text = pictureData.text

        // TODO: - Download picture
        downloadImage(with: pictureData.url)
    }

    func downloadImage(with path: String) {
        NetworkManager.shared.downloadImage(with: path)
    }
}
