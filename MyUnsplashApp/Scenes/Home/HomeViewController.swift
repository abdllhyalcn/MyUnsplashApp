//
//  HomeViewController.swift
//  MyUnsplashApp
//
//  Created by Abdullah Yalçın on 12.07.2023.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var refreshImageButton: UIButton!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private let viewModel = HomeViewModel()
    override init() {
        super.init(R.string.localizable.tabHomeTitle())
    }
    
    override func setup() {
        super.setup()
        viewModel.fetchImages(completion: { result in
            switch result {
            case .success(_):
                break
            case .failure(_):
                self.showAlert(message: R.string.localizable.constantImageFetchError())
            }
        })
        
        if viewModel.hasImages() {
            imageView.
        }
        
        
    }

}
