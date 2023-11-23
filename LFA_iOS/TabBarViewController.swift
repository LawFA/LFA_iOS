//
//  TabBarViewController.swift
//  LFA_iOS
//
//  Created by 김강현 on 11/23/23.
//

import UIKit

class TabBarViewController: UITabBarController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.setupViews()
        
        UITabBar.appearance().tintColor = UIColor.black
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().backgroundColor = .white
        
    }
    
    private func setupViews() {
        let groupTabBarItem = UITabBarItem(title: "단체 리스트", image: UIImage(systemName: "person.3"), selectedImage: UIImage(systemName: "person.3.fill"))
        
        let homeTabBarItem = UITabBarItem(title: "사건 작성", image: UIImage(systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper.fill"))
        
        let listTabBarItem = UITabBarItem(title: "알림", image: UIImage(systemName: "list.bullet.rectangle.portrait"), selectedImage: UIImage(systemName: "list.bullet.rectangle.portrait.fill"))
        
        let insets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
        homeTabBarItem.imageInsets = insets
        listTabBarItem.imageInsets = insets
        groupTabBarItem.imageInsets = insets
        
        let titleOffset = UIOffset(horizontal: 0, vertical: 10)
        homeTabBarItem.titlePositionAdjustment = titleOffset
        listTabBarItem.titlePositionAdjustment = titleOffset
        groupTabBarItem.titlePositionAdjustment = titleOffset
        
        let groupVC = generateNavController(vc: GroupHomeViewController(), tabBarItem: groupTabBarItem)
        let homeVC = generateNavController(vc: UserCaseViewController(), tabBarItem: homeTabBarItem)
        let listVC = generateNavController(vc: AlarmListViewController(), tabBarItem: listTabBarItem)
        
        
        self.viewControllers = [groupVC, homeVC, listVC]
        
        self.selectedIndex = 0
        
    }
    
    fileprivate func generateNavController(vc: UIViewController, tabBarItem: UITabBarItem) -> UINavigationController {
        
        navigationItem.title = title
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = tabBarItem
        
        return navController
    }
}

