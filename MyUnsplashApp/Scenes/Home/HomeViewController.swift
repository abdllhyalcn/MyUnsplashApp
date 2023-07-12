//
//  HomeViewController.swift
//  MyUnsplashApp
//
//  Created by Abdullah Yalçın on 12.07.2023.
//

import UIKit
import Kingfisher

class HomeViewController: BaseViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var refreshImageButton: UIButton!
    @IBOutlet private weak var descriptionImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var locationImageView: UIImageView!
    @IBOutlet private weak var locationLabel: UILabel!
    
    private let viewModel = HomeViewModel()
    override init() {
        super.init(R.string.localizable.tabHomeTitle())
    }
    
    override func setup() {
        super.setup()
        showActivityIndicator()
        viewModel.fetchImages(completion: { result in
            self.hideActivityIndicator()
            switch result {
            case .success(_):
                if self.viewModel.hasImages() {
                    self.setImage(data: self.viewModel.getRandomImageInfo())
                }
            case .failure(_):
                self.showAlert(message: R.string.localizable.constantImageFetchError())
            }
        })
        
        refreshImageButton.layer.cornerRadius = 8
    }
    
    private func setImage(data: ImageInfo) {
        imageView.kf.setImage(with: data.urls.regularURL, completionHandler: { result in
            self.hideActivityIndicator()
            self.refreshImageButton.isHidden = false
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.saveTouch))
            if let alt_description = data.alt_description {
                self.descriptionImageView.isHidden = false
                self.descriptionLabel.text = alt_description
                self.descriptionLabel.isHidden = false
            } else {
                self.descriptionImageView.isHidden = true
                self.descriptionLabel.isHidden = true
            }
            if let location = data.user?.location {
                self.locationImageView.isHidden = false
                self.locationLabel.text = location
                self.locationLabel.isHidden = false
            } else {
                self.locationImageView.isHidden = true
                self.locationLabel.isHidden = true
            }
        })
    }
    
    @objc private func saveTouch() {
        viewModel.saveImage()
    }
    
    @IBAction func refreshTouch(_ sender: Any) {
        refreshImageButton.isHidden = true
        self.descriptionImageView.isHidden = true
        self.descriptionLabel.isHidden = true
        self.locationImageView.isHidden = true
        self.locationLabel.isHidden = true
        self.navigationItem.rightBarButtonItem = nil
        self.showActivityIndicator()
        setImage(data: viewModel.getRandomImageInfo())
    }
    
    
    
}
