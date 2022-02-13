//
//  MainTabBarControllerViewController.swift
//  firstApp
//
//  Created by MacLex on 08.02.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTapBar()
        setupItems()
        
    }
    private func setupTapBar () {
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .specialDarkGreen
        tabBar.unselectedItemTintColor = .specialGray
        tabBar.layer.borderColor = UIColor.specialLightBrown.cgColor
        tabBar.layer.borderWidth = 1
        
    }
    private func setupItems () {
        let mainVC = MainViewController()
        let profileVC = ProfileViewController()
        let statisticVC = StatisticViewController()
        let starWorkoutVC = StartWorkoutViewController()
        
        setViewControllers([mainVC,profileVC,statisticVC,starWorkoutVC], animated: true)
        
        guard  let items = tabBar.items else { return }
        
        items[0].title = "Main"
        items[1].title = "Statistic"
        items[2].title = "Profile"
        
        items[0].image = UIImage(named: "tabBarMain")
        items[1].image = UIImage(named: "tabBarStatistic")
        items[2].image = UIImage(named: "tabBarProfile")
        
        
        
        
    }
    
}
