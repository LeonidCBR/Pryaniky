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
        contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 160).isActive = true

        contentView.addSubview(pictureView)
        pictureView.anchor(top: contentView.topAnchor, paddingTop: 30.0,
                           bottom: contentView.bottomAnchor, paddingBottom: 30.0,
                           leading: contentView.leadingAnchor, paddingLeading: 20.0,
                           width: 100.0)

        contentView.addSubview(pryanikText)
        pryanikText.anchor(leading: pictureView.trailingAnchor, paddingLeading: 10.0,
                           trailing: contentView.trailingAnchor, paddingTrailing: 10.0,
                           centerY: contentView.centerYAnchor)
    }

    override func updateUI() {
        super.updateUI()

        guard let picture = pryanik as? Picture else {
            print("ERROR: Failed to casting picture data!")
            return
        }

        // TODO: - Download picture
        downloadImage(with: picture.url)
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
