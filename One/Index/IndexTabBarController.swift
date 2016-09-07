//
//  IndexTabBarController.swift
//  One
//
//  Created by Hu on 16/8/24.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

class IndexTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let home = HomeNavigationController(rootViewController: HomeViewController())
        let reading = ReadingNavigationController(rootViewController: ReadingViewController())
        let music = MusicNavigationController(rootViewController: MusicViewController())
        let movie = MovieNavigationController(rootViewController: MovieViewController())
        
        
        home.tabBarItem = self.createTabBatItem(title: "首页", image: UIImage(named: "tabbar_guide_unselected"), selectedImage: UIImage(named: "tabbar_guide_selected"))
        reading.tabBarItem = self.createTabBatItem(title: "阅读", image: UIImage(named: "tabbar_hot_unselected"), selectedImage: UIImage(named: "tabbar_hot_selected"))
        music.tabBarItem = self.createTabBatItem(title: "音乐", image: UIImage(named: "tabbar_classify_unselected"), selectedImage: UIImage(named: "tabbar_classify_selected"))
        movie.tabBarItem = self.createTabBatItem(title: "电影", image: UIImage(named: "tabbar_mine_unselected"), selectedImage: UIImage(named: "tabbar_mine_selected"))
        
        self.viewControllers = [home, reading, music, movie]
    }
    
    func createTabBatItem(title title: String, image: UIImage?, selectedImage: UIImage?) -> UITabBarItem {
        let imageCopy = image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        let selectedImageCopy = selectedImage!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        let tabBarItem = UITabBarItem(title: title, image: imageCopy, selectedImage: selectedImageCopy)
        return tabBarItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
