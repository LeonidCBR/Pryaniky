//
//  MainTableViewController.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import UIKit

class MainTableViewController: UITableViewController {

    // MARK: - Properties

    let pryanikyViewModel = PryanikyViewModel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchData()
    }


    // MARK: - Methods

    func configureUI() {
        tableView.register(TextCell.self, forCellReuseIdentifier: K.Identifier.textCell)
        tableView.register(PictureCell.self, forCellReuseIdentifier: K.Identifier.pictureCell)
        tableView.register(SelectorCell.self, forCellReuseIdentifier: K.Identifier.selectorCell)

        // dummy cell
        tableView.register(DummyCell.self, forCellReuseIdentifier: K.Identifier.dummyCell)
    }

    func fetchData() {
        pryanikyViewModel.fetchItems { [weak self] error in
            if let error = error {
                // TODO: implement this section
                print("DEBUG: Error while fetching data \(error)")
                return
            }
            self?.tableView.reloadData()
        }
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return pryanikyViewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pryanikyViewModel.rowsPerSection[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: ParentCell

        let pryanikCellViewModel = pryanikyViewModel.pryanikCellViewModel(inSection: indexPath.section, atRow: indexPath.row)
        
        switch pryanikCellViewModel.pryanik.unassociated {
        case .hz:
            cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.textCell, for: indexPath) as! ParentCell
        case .picture:
            cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.pictureCell, for: indexPath) as! ParentCell
        case .selector:
            cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.selectorCell, for: indexPath) as! ParentCell
        case .unknown:
            cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.dummyCell, for: indexPath) as! ParentCell
        }

        cell.pryanikCellViewModel = pryanikCellViewModel
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        let pryanikCellViewModel = pryanikyViewModel.pryanikCellViewModel(inSection: indexPath.section, atRow: indexPath.row)
        let infoController = InfoViewController(with: pryanikCellViewModel)
        present(infoController, animated: true)
    }

}
