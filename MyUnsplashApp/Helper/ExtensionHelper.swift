//
//  UIViewControllerExtension.swift
//  MyUnsplashApp
//
//  Created by Abdullah Yalçın on 12.07.2023.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(message: String?) {
        let alert = UIAlertController(title: R.string.localizable.constantInformation(), message: message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }
}

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

// MARK: Reusable UITableViewCell

extension UITableViewCell: Reusable { }

// MARK: Reusable UITableView

extension UITableView {
    
    func register<T: UITableViewCell>(cellClass: T.Type = T.self) {
        let bundle = Bundle(for: cellClass.self)
        if bundle.path(forResource: cellClass.reuseIdentifier, ofType: "nib") != nil {
            let nib = UINib(nibName: cellClass.reuseIdentifier, bundle: bundle)
            register(nib, forCellReuseIdentifier: cellClass.reuseIdentifier)
        } else {
            register(cellClass.self, forCellReuseIdentifier: cellClass.reuseIdentifier)
        }
    }
    
}
