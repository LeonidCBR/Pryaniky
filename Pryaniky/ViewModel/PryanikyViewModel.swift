//
//  PryanikListViewModel.swift
//  Pryaniky
//
//  Created by Яна Латышева on 22.07.2021.
//

import Foundation

typealias DataHandler = () -> Void


final class PryanikyViewModel {

    lazy var feed: Feed = Feed()

    var numberOfSections: Int = 0
    var rowsPerSection: [Int] = []

//    var reloadHandler: DataHandler = { }

    private func calculateRowsPerSection() {
        rowsPerSection = []
        for item in feed.viewItems {
            let pryaniky = feed.pryaniky.filter { $0.unassociated.rawValue == item }
            let count = pryaniky.count
            rowsPerSection.append(count)
        }
    }

    func pryanik(inSection section: Int, atRow row: Int) -> Pryanik {
        let item = feed.viewItems[section]
        let pryaniky = feed.pryaniky.filter { $0.unassociated.rawValue == item }
        return pryaniky[row]
    }

    func fetchItems(completion: @escaping (_ error: Error?) -> Void) {
        NetworkManager.shared.downloadJsonData() { [weak self] result in
            switch result {
            case .success(let feed):
                self?.feed = feed
                self?.numberOfSections = feed.viewItems.count
                self?.calculateRowsPerSection()
//                self?.reloadHandler()
                completion(nil)

            case .failure(let error):
                completion(error)
            }
        }
    }

}
