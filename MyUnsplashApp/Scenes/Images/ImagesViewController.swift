//
//  ImagesViewController.swift
//  MyUnsplashApp
//
//  Created by Abdullah Yalçın on 12.07.2023.
//

import UIKit

class ImagesViewController: BaseViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var emptyLabel: UILabel!
    
    private let viewModel = ImagesViewModel()
    override init() {
        super.init(R.string.localizable.tabImagesTitle())
    }
    
    override func setup() {
        super.setup()
        
        tableView.register(cellClass: ImageTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if viewModel.isImagesEmpty() {
            emptyLabel.isHidden = false
        } else {
            emptyLabel.isHidden = true
            tableView.reloadData()
        }
    }
    
    @objc private func trashTouch() {
        viewModel.removeItems(at: tableView.indexPathForSelectedRow!.row)
        tableView.deleteRows(at: [tableView.indexPathForSelectedRow!], with: .automatic)
        self.navigationItem.rightBarButtonItem = nil
        if viewModel.isImagesEmpty() {
            emptyLabel.isHidden = false
        }
    }

}

extension ImagesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getImageCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.reuseIdentifier, for: indexPath) as! ImageTableViewCell
        cell.setup(data: viewModel.getImage(row: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(self.trashTouch))
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.navigationItem.rightBarButtonItem = nil
    }
    
}
