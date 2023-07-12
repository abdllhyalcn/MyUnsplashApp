//
//  BaseViewController.swift
//  MyUnsplashApp
//
//  Created by Abdullah Yalçın on 12.07.2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    private let isNavigationBarHidden: Bool
    init() {
        self.isNavigationBarHidden = true
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
    }
    
    init(isNavigationBarHidden: Bool,_ title: String? = nil, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.isNavigationBarHidden = isNavigationBarHidden
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title = title
        hidesBottomBarWhenPushed = true
    }
    
    init(isNavigationBarHidden: Bool,_ title: String? = nil) {
        self.isNavigationBarHidden = isNavigationBarHidden
        super.init(nibName: nil, bundle: nil)
        self.title = title
        hidesBottomBarWhenPushed = true
    }
    
    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("disabled init")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationOnWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(false)
    }
    
    func setup() {
    }
    
    func navigationOnWillAppear() {
        navigationController?.isNavigationBarHidden = isNavigationBarHidden
        if(!isNavigationBarHidden) {
            if #available(iOS 14.0, *) {
                navigationItem.backButtonDisplayMode = .generic
            }
        }
    }
    
}
