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
        self.setupTheme()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension IGSBaseViewController {
    func setupTheme() {
        
        self.navigationController?.setupNavigationTheme()
        self.view.backgroundColor = UIColor(red: 230/255,green: 230/255, blue: 230/255, alpha: 1)
    }
}

extension UINavigationController {
    func setupNavigationTheme() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 175/255, green: 100/255, blue: 35/255, alpha: 1)
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white] // Title text
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white] // Title text

        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        self.navigationBar.tintColor = .white
        UIBarButtonItem.appearance().tintColor = .white
        
    }
}
