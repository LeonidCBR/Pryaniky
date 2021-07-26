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
//        iv.backgroundColor = .red
        return iv
    }()


    // MARK: - Methods

    override func configureUI() {
        contentView.addSubview(pictureView)
        let side = frame.width - 100.0
        pictureView.anchor(top: contentView.topAnchor, paddingTop: 30.0,
                           width: side,
                           height: side,
                           centerX: contentView.centerXAnchor)

        contentView.addSubview(pryanikText)
        pryanikText.anchor(top: pictureView.bottomAnchor, paddingTop: 20.0,
                           bottom: contentView.bottomAnchor, paddingBottom: 30.0,
                           leading: pictureView.leadingAnchor,
                           trailing: pictureView.trailingAnchor)
    }

    override func updateUI() {
        super.updateUI()
        if case .picture(let picture) = pryanikCellViewModel?.pryanik {
            downloadImage(with: picture.url)
        }
    }

    func downloadImage(with path: String) {
        NetworkManager.shared.downloadImage(with: path) { [weak self] result in
            switch result {
            case .success(let data):
                self?.pictureView.image = UIImage(data: data)
            case .failure(let error):
                print("DEBUG: Delegate error \(error.localizedDescription)")
                self?.pictureView.backgroundColor = .red
            }
        }
    }
}
