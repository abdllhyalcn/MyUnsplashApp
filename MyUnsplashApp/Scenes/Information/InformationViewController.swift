//
//  AboutRezinnViewController.swift
//  rezinn
//
//  Created by Mehmet Biçici on 13.07.2023.
//

import UIKit
import WebKit

class InformationViewController: BaseViewController {
    
    @IBOutlet weak var firstProfileImageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var firstInstagramImageView: UIImageView!
    @IBOutlet weak var firstInstagramLabel: UILabel!
    
    @IBOutlet weak var firstLinkedInImageView: UIImageView!
    @IBOutlet weak var firstLinkedInLabel: UILabel!
    
    @IBOutlet weak var firstGmailImageView: UIImageView!
    @IBOutlet weak var firstGmailLabel: UILabel!
    
    
    @IBOutlet weak var secondProfileImageView: UIImageView!
    @IBOutlet weak var secondNameLabel: UILabel!
    
    @IBOutlet weak var secondInstagramImageView: UIImageView!
    @IBOutlet weak var secondInstagramLabel: UILabel!
    
    @IBOutlet weak var secondLinkedInImageView: UIImageView!
    @IBOutlet weak var secondLinkedInLabel: UILabel!
    
    
    @IBOutlet weak var secondGmailImageView: UIImageView!
    @IBOutlet weak var secondGmailLabel: UILabel!
    
    override init() {
        super.init(R.string.localizable.tabInformationTitle())
    }
    
    override func setup() {
        super.setup()
        
        
        firstNameLabel.text = "Abdullah Yalçın"
        secondNameLabel.text = "Mehmet Biçici"
        
        firstInstagramLabel.text = "Instagram"
        firstLinkedInLabel.text = "LinkedIn"
        firstGmailLabel.text = "Gmail"
        
        secondInstagramLabel.text = "Instagram"
        secondLinkedInLabel.text = "LinkedIn"
        secondGmailLabel.text = "Gmail"
        
        let firstInstagramImageViewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(firstInstagramImageViewTapped))
        firstInstagramImageView.isUserInteractionEnabled = true
        firstInstagramImageView.addGestureRecognizer(firstInstagramImageViewGestureRecognizer)
        
        let secondInstagramImageViewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(secondInstagramImageViewTapped))
        secondInstagramImageView.isUserInteractionEnabled = true
        secondInstagramImageView.addGestureRecognizer(secondInstagramImageViewGestureRecognizer)
        
        let firstLinkedInImageViewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(firstLinkedInImageViewTapped))
        firstLinkedInImageView.isUserInteractionEnabled = true
        firstLinkedInImageView.addGestureRecognizer(firstLinkedInImageViewGestureRecognizer)
        
        let secondLinkedInImageViewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(secondLinkedInImageViewTapped))
        secondLinkedInImageView.isUserInteractionEnabled = true
        secondLinkedInImageView.addGestureRecognizer(secondLinkedInImageViewGestureRecognizer)
        
        let firstGmailImageViewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(firstGmailImageViewTapped))
        firstGmailImageView.isUserInteractionEnabled = true
        firstGmailImageView.addGestureRecognizer(firstGmailImageViewGestureRecognizer)
        
        let secondGmailImageViewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(secondGmailImageViewTapped))
        secondGmailImageView.isUserInteractionEnabled = true
        secondGmailImageView.addGestureRecognizer(secondGmailImageViewGestureRecognizer)
        
    }
    
    @objc func firstInstagramImageViewTapped() {
        guard let instagram = URL(string: "https://www.instagram.com/abdllhyalcn") else { return }
        UIApplication.shared.open(instagram)
    }
    
    @objc func secondInstagramImageViewTapped() {
        guard let instagram = URL(string: "https://www.instagram.com/") else { return }
        UIApplication.shared.open(instagram)
    }
    
    @objc func firstLinkedInImageViewTapped() {
        guard let instagram = URL(string: "https://www.linkedin.com/in/abdullah-yalcin/") else { return }
        UIApplication.shared.open(instagram)
    }
    
    @objc func secondLinkedInImageViewTapped() {
        guard let instagram = URL(string: "https://www.linkedin.com/in/mehmet-bicici-07/") else { return }
        UIApplication.shared.open(instagram)
    }
    
    @objc func firstGmailImageViewTapped() {
        let supportEmail = "a.yalcn@outlook.com"
        if let emailURL = URL(string: "mailto:\(supportEmail)"), UIApplication.shared.canOpenURL(emailURL)
        {
            UIApplication.shared.open(emailURL, options: [:], completionHandler: nil)
        }
    }
    
    @objc func secondGmailImageViewTapped() {
        let supportEmail = "mehmet.bcc.07@gmail.com"
        if let emailURL = URL(string: "mailto:\(supportEmail)"), UIApplication.shared.canOpenURL(emailURL)
        {
            UIApplication.shared.open(emailURL, options: [:], completionHandler: nil)
        }
    }
}
