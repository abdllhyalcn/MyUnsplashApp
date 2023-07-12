//
//  ImageTableViewCell.swift
//  MyUnsplashApp
//
//  Created by Abdullah Yalçın on 13.07.2023.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var descriptionImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var locationImageView: UIImageView!
    @IBOutlet private weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(data: ImageInfo) {
        mainImageView.kf.setImage(with: data.urls.regularURL, completionHandler: { result in
            if let alt_description = data.alt_description {
                self.descriptionImageView.isHidden = false
                self.descriptionLabel.text = alt_description
                self.descriptionLabel.isHidden = false
            }
            if let location = data.user?.location {
                self.locationImageView.isHidden = false
                self.locationLabel.text = location
                self.locationLabel.isHidden = false
            }
        })
    }
    
}
