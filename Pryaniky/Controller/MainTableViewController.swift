//
//  MainTableViewController.swift
//  Pryaniky
//
//  Created by Яна Латышева on 09.07.2021.
//

import UIKit

class MainTableViewController: UITableViewController {

    // MARK: - Properties

    var viewItems: [String]?
    var dataItems: [DataItem]?


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchData()
    }

    // MARK: - Methods

    func configureUI() {
        tableView.register(TextCell.self, forCellReuseIdentifier: JsonDataType.text.description)
        tableView.register(PictureCell.self, forCellReuseIdentifier: JsonDataType.picture.description)
        tableView.register(SelectorCell.self, forCellReuseIdentifier: JsonDataType.selector.description)

        // dummy cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: K.mainCellIdentifier)
    }

    func fetchData() {

        print("DEBUG: Fetching data.")

        NetworkManager.shared.downloadJsonData() { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let jsonData):
                self.viewItems = jsonData.view
                self.dataItems = jsonData.data
                self.tableView.reloadData()

            case .failure(let error):
                print("DEBUG: Process an error \(error.localizedDescription)")
                PresenterManager.shared.showMessage(withTitle: "Ошибка!", andMessage: error.localizedDescription, byViewController: self)
            }
        }
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewItems?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let typeName = viewItems?[indexPath.row], let jsonDataType = K.dictTypes[typeName] else { //JsonDataType(rawValue: typeName) else {
            // return dummy cell
            print("DEBUG: Return dummy cell")
            return tableView.dequeueReusableCell(withIdentifier: K.mainCellIdentifier, for: indexPath)
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: jsonDataType.description, for: indexPath) as! ParentCell
        cell.pryanik = dataItems?.first() {$0.name == typeName}?.data
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        guard let viewItemName = viewItems?[indexPath.row] else {
            return
        }

        let id = indexPath.row
        let infoController = InfoViewController()
        infoController.infoItem = (id, viewItemName)
        present(infoController, animated: true)
    }

}
