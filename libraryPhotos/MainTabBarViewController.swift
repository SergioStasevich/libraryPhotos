//
//  MainTabBarViewController.swift
//  libraryPhotos
//
//  Created by Siarhei Stasevich on 13/11/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let photoVC = PhotosCV(collectionViewLayout: UICollectionViewFlowLayout())
        
        viewControllers = [
            generationVC(navigation: photoVC, title: "PHOTOS", image: UIImage(imageLiteralResourceName: "2")),
            generationVC(navigation: ViewController(), title: "Favourites", image: UIImage(imageLiteralResourceName: "1"))
        ]
        
    }
    
    private func generationVC (navigation: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigatiomVC = UINavigationController(rootViewController: navigation)
        navigatiomVC.tabBarItem.title = title
        navigatiomVC.tabBarItem.image = image
        return navigatiomVC
    }
}

