//
//  TabBarController.swift
//  views
//
//  Created by Kanat on 30.09.17.
//  Copyright © 2017 Kanat. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationController = UINavigationController(rootViewController: SearchViewController())
        navigationController.tabBarItem.image = UIImage(named: "surf")
        
        let addPhotoController = UINavigationController(rootViewController: AddPhotoController())
        addPhotoController.tabBarItem.image = UIImage(named: "Add Photo")
        
        
        let fichaVC = FichaPageViewController()
        fichaVC.navigationItem.titleView = UIImageView(image: UIImage(named: "logo"))
        let fichaPageController = UINavigationController(rootViewController: fichaVC)
        fichaPageController.tabBarItem.image = UIImage(named: "Thumb")

        viewControllers = [navigationController, addPhotoController, fichaPageController]
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
