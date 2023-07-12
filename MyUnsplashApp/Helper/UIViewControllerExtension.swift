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
