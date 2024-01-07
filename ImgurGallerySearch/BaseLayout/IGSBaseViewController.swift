//
//  IGSBaseViewController.swift
//  ImgurGallerySearch
//
//  Created by Chaudhari, Dipak Bharat (external - Service) on 06/01/24.
//

import UIKit

    // MARK: - Base controller created for consistent UI modification
class IGSBaseViewController: UIViewController {
}

// MARK: - View Life cycle
extension IGSBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 230/255,green: 230/255, blue: 230/255, alpha: 1)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension IGSBaseViewController {
    func setupHeaderView() {
        
    }
}
