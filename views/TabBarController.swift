//
//  TabBarController.swift
//  views
//
//  Created by Kanat on 30.09.17.
//  Copyright © 2017 Kanat. All rights reserved.
//

import UIKit
import SnapKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationController = UINavigationController(rootViewController: SearchViewController())
        navigationController.tabBarItem.image = UIImage(named: "surf")
        
        let addPhotoController = UINavigationController(rootViewController: AddPhotoController())
        addPhotoController.tabBarItem.image = UIImage(named: "Add Photo")
        
        
<<<<<<< HEAD
        let fichaPageController = UINavigationController(rootViewController: FichaPageViewController())
        fichaPageController.tabBarItem.image = UIImage(named: "Thumb")

        viewControllers = [navigationController, addPhotoController, fichaPageController]
        
    }
    
//    let navImage: UIImageView = {
//        let logo = UIImageView()
//        logo.image = UIImage(named: "logo")
//        return logo
//    }()
//
=======
        let fichaVC = FichaPageViewController()
        fichaVC.navigationItem.titleView = UIImageView(image: UIImage(named: "logo"))
        let fichaPageController = UINavigationController(rootViewController: fichaVC)
        fichaPageController.tabBarItem.image = UIImage(named: "Thumb")

        viewControllers = [navigationController, addPhotoController, fichaPageController]
    }

>>>>>>> 0f4b2d8f339eb2cc9c5e49854f891ab55647018c
}
