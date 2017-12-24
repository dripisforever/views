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
}
