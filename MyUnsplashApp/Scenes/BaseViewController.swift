//
//  BaseViewController.swift
//  MyUnsplashApp
//
//  Created by Abdullah Yalçın on 12.07.2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var activityView: UIActivityIndicatorView?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    init(_ title: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("disabled init")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(false)
    }
    
    func setup() {
    }
    
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        DispatchQueue.main.async {
            self.activityView?.startAnimating()
        }
    }

    func hideActivityIndicator(){
        if (activityView != nil){
            DispatchQueue.main.async {
                self.activityView?.stopAnimating()
            }
        }
    }
    
}
