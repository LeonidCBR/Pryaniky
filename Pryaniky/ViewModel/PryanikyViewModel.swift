//
//  PryanikListViewModel.swift
//  Pryaniky
//
//  Created by Яна Латышева on 22.07.2021.
//

import Foundation

typealias DataHandler = () -> Void


final class PryanikyViewModel {

    lazy private var feed: Feed = Feed()
    var pryanikCellViewModels: [PryanikCellViewModel] = []

    var numberOfSections: Int = 0
    var rowsPerSection: [Int] = []

//    var reloadHandler: DataHandler = { }

    private func configure() {
        pryanikCellViewModels = []
        pryanikCellViewModels.reserveCapacity(feed.pryaniky.count)
        for pryanik in feed.pryaniky {
            let prynikCellViewModel = PryanikCellViewModel(from: pryanik)
            pryanikCellViewModels.append(prynikCellViewModel)
        }

        numberOfSections = feed.viewItems.count
        calculateRowsPerSection()

    }

    private func calculateRowsPerSection() {
        rowsPerSection = []
//        for item in feed.viewItems {
//            let pryaniky = feed.pryaniky.filter { $0.unassociated.rawValue == item }
//            let count = pryaniky.count
//            rowsPerSection.append(count)
//        }
        for item in feed.viewItems {
            let pryaniky = pryanikCellViewModels.filter { $0.pryanik.unassociated.rawValue == item }
            let count = pryaniky.count
            rowsPerSection.append(count)
        }
    }

//    func pryanik(inSection section: Int, atRow row: Int) -> Pryanik {
//        let item = feed.viewItems[section]
//        let pryaniky = feed.pryaniky.filter { $0.unassociated.rawValue == item }
//        return pryaniky[row]
//    }

    func pryanikCellViewModel(inSection section: Int, atRow row: Int) -> PryanikCellViewModel {
        let item = feed.viewItems[section]
        let pryaniky = pryanikCellViewModels.filter { $0.pryanik.unassociated.rawValue == item }
        return pryaniky[row]
    }

    func fetchItems(completion: @escaping (_ error: Error?) -> Void) {
        NetworkManager.shared.downloadJsonData() { [weak self] result in
            switch result {
            case .success(let feed):
                self?.feed = feed

                self?.configure()
//                self?.numberOfSections = feed.viewItems.count
//                self?.calculateRowsPerSection()



//                self?.reloadHandler()
                completion(nil)

            case .failure(let error):
                completion(error)
            }
        }
    }

}
